---
layout: post
title: "Extracting Form Models in Android"
categories:
- blog
---

In my continuing [quest to get code out of Android Activities][quest], I've implemented
the traditional "Form Model" pattern in a recent project with great success and wanted
to share my thoughts.

The basic idea is to extract the code for handling the UI interactions, as well
as the data binding and any state keeping, into its own class. This separation
feels natural and keeps our Activities simple.

I think this is an area that is not often explored in Android &mdash; there is
less of an emphasis on data entry and forms in most of the developer documentation.
When you think of a lot of the popular social apps, most of the screens are just
displaying information; they might have a few screens to compose a tweet or message,
but the pain is not high.

For me, my past two Android applications have been *very heavy* on data entry. I think
this is partial due to the domains (health care, finance) and the clients (closer to
Enterprise than Start-up). But we were constantly making complex messes of our "form
input" screens &mdash; especially when we started adding things like editing existing
items, prompting to discard unsaved changes, and handling rotation without clearing
all the fields. 

Using this form model approach has led to fewer bugs, more understandable code, and 
happier developers.


## Example: Search form

We have a banking app and we want to have a screen for searching through our 
transactions. There will be multiple filters: let's just start with an account spinner,
a keyword field and an amount range. (Hopefully, you can see how more of these filters will
likely be added in the future and how the complexity could explode).

Instead of shoving all of the views, click handlers, validation logic, and data binding
into an Activity, we will create a `SearchForm` class to handle all of this.

```java
public class SearchForm extends LinearLayout {

  @InjectView(R.id.account)
  private Spinner mAccountSpinner;
  private AccountAdapter mAccountAdapter;

  @InjectView(R.id.keyword)
  private EditText mKeywordField;

  @InjectView(R.id.min_amount)
  private CurrencyEditText mMinAmountField;

  @InjectView(R.id.max_amount)
  private CurrencyEditText mMaxAmountField;
  
  public SearchFormModel(Context context, AttributeSet attrs) {
    super(context, attrs);
    setup(context);
  }

  private void setup(Context context) {
    LayoutInflater.from(context).inflate(R.layout.search_form, this, true);

    ButterKnife.inject(this); // <3 @JakeWharton

    mAccountAdapter = new AccountAdapter(context);
    mAccountSpinner.setAdapter(mAccountAdapter);
  }

  public initialize(List<Account> accounts) {
    mAccountAdapter.setItems(accounts);
  }

  public String getKeywords() {
    return mKeywordField.getText().toString();
  }

  public void setKeywords(String keywords) {
    mKeywordField.setText(keywords);
  }

  public MoneyAmount getMinimumAmount() {
    return mMinAmountField.getAmount();
  }

  public void setMinimumAmount(double amount) {
    mMinmountField.setAmountFromDouble(amount);
  }

  public MoneyAmount getMaximumAmount() {
    return mMaxAmountField.getAmount();
  }

  public void setMaximumAmount(double amount) {
    mMaxAmountField.setAmountFromDouble(amount);
  }

  public Account getSelectedAccount() {
    return mAccountSpinner.getSelectedItem();
  }  

  public boolean validate() {
    clearErrors();
    boolean isValid = true;

    if (!isValidAmountRange()) {
      isValid = false;
      mMinAmountField.setError("Invalid range");
      mMaxAmountField.setError("Invalid range");
    }

    return isValid;
  }

  private boolean isValidAmountRange() {
    return getMinimumAmount() <= getMaximumAmount();
  }

  private void clearErrors() {
    mMinAmountField.setError(null);
    mMaxAmountField.setError(null);
  }

  public SearchParameters buildParameters() {
    return new SearchParameters(getSelectedAccount(),
                                getKeywords(),
                                getMinimumAmount(),
                                getMaximumAmount());
  }

  public void persist(Bundle outState) {
    outState.putInt("SELECTED_ACCT_INDEX", mAccountSpinner.getSelectedItemPosition());
  }

  public void restore(Bundle bundle) {
    int accountPosition = bundle.getInt("SELECTED_ACCT_INDEX");
    mAccountSpinner.setSelection(accountPosition, false);
  }
}
```

We create a class that derives from `LinearLayout` (or maybe a `FrameLayout` if you prefer)
which allows us to group up the related controls into one layout that we will inflate. We
setup our views and create an adapter for the list of accounts.

We wrap up the Android controls in getter/setters &mdash; this may be somewhat controversial,
but I think it makes for a better public API for `SearchForm`. We've got a method to validate
the user input and apply errors if needed. We have `buildParameters()` that does some data
binding and returns a domain object. And we finish it off with two methods that interact with
Android's `onSaveInstanceState` Bundle to handle custom configuration changes (note that most
stock UI controls will handle their own persistence).

This is about a hundred lines of code and is pretty good for the most part. Everything in this
class seems like it belongs in a "search form" object and there are good extension points for
future features (date range filter, expense vs deposit filters, checks only, etc). We
intentionally avoid dealing with **how** we get some of the data, leaving that up to other,
more appropriate parts of the code.

What do things look like on the Activity side?

```java
public class TransactionSearchActivity extends BaseActivity {
  
  @InjectView(R.id.search_form)
  private SearchForm mForm;

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    setContentView(R.layout.transaction_search);
    setTitle("Search Your Transactions");

    mForm.initialize(mAccounts); // fetch accounts via API/DB/etc

    if (savedInstanceState != null) {
      mForm.restore(savedInstanceState);
    }
  }

  @Override
  public boolean onOptionsItemSelected(MenuItem menu) {
    switch (menu.getItemId()) {
      case R.id.action_submit_search:
        onSubmitSearch();
        return true;
    }

    return super.onOptionsItemSelected(menu)
  }

  private void onSubmitSearch() {
    if (mForm.validate()) {
      // Do your magic, post to an API/DB/etc
      // You have access to the domain object with mForm.buildParameters()
    }
  }

  @Override
  public boolean onCreateOptionsMenu(Menu menu) {
    getMenuInflater().inflate(R.menu.search_menu, menu);
    return super.onCreateOptionsMenu(menu);
  }

  @Override
  protected void onSaveInstanceState(Bundle outState) {
    super.onSaveInstanceState(outState);

    mForm.persist(outState);
  }
}
```

Our Activity will include a `<com.example.SearchForm />` tag in it's XML layout and
then just handle high-level user interactions (hitting submit in the ActionBar) and
coordinates fetching and storing data. The heavy UI lifting and form logic is delegated 
to the `SearchForm`.

This activity comes in at around 50 lines &mdash; most of which is just boilerplate from
the framework for lifecycles and menu creation.

## Overall impressions

Things get a bit more complex once you start talking to an API or database, but overall
by moving the form-specific logic and view concerns out of the Activity, the code becomes
easier to understand. 

I can write a whole slew of Robolectric tests on `SearchForm` without
getting bogged down in the activity lifecycle. I can write tests about the interactions with
form, the ActionBar, and the backend without exercising every edgecase. And when it comes 
time to add a new filter to the form, I will likely avoid having to make any changes to 
the Activity (ala the [Open/closed principle][ocp] for those playing Design Pattern Bingo 
at home).

Coming from other frameworks (and speaking with other developers), data binding is
pretty lacking on Android. Something still seems a bit off with this design because we
are coupled tightly to Android classes and there is dependency on knowing the order of
methods to call (e.g. `initialize()` should be called before `validate()`) &mdash; however
I think it is an improvement over the "giant mud ball Activity".

As your form models get more and more complex, you may want to think about extracting
validations to a separate object and moving custom view functionality into their own
controls (as you can see in our example with the `CurrencyEditText`). Also, consider
that complex forms might better serve the user being broken up into multiple steps as
a wizard.

We've found this pattern to be a big win in untangling hairy form code and I would
recommend giving it a try. I've formalized the code patterns a bit more and created a
small base class to reduce a bit of boilerplate going forward, feel free to [borrow it][gist].

---

I'd love to hear your thoughts, criticisms, or suggestions; get in touch with me
on [Twitter][tw].

[quest]: http://www.mdswanson.com/blog/2014/04/07/durable-android-rest-clients.html
[ocp]: http://en.wikipedia.org/wiki/Open/closed_principle
[gist]: https://gist.github.com/swanson/c6c88710ff63d88de004
[tw]: https://twitter.com/_swanson













