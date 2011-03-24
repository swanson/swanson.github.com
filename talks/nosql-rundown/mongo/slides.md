!SLIDE bullets center
![mongodb](mongodb.png)  

* JSON-like documentrs
* Index any field
* Rich queries

!SLIDE
# If it makes sense for your model

    @@@ Python
    class User()
        string Name
        List<string> Addresses
        List<string> PhoneNums
        List<Order> Orders

    class Order()
        int Price
        List<Widget> Items

!SLIDE
## Relational model starts to get bloated 
    @@@ Sql
    tblUsers
        -tblUserAddresses
        -tblUserPhoneNums
        -tblUserOrders
    tblOrders
        -tblOrderItems
# Join, Join, Join ...

!SLIDE
    @@@ Json
    {
        "name":"matt",
        "addresses": [
            "123 Main St", "4 Center Green"
        ],
        ...

        "orders": [
            {
                "name": "Learn MongoDB",
                "price": 30
            },
            {
                "name": "Widget #7",
                "price": 77
            }
        ]
    }

!SLIDE
    @@@
    db.Users.find(
        {"orders.name" : "Learn MongoDB"}
    )

    vs

    select * from tblUsers U
    join tblUserOrders UO
    on UO.UserId = U.oid
    join tblOrders O
    on O.oid = UO.OrderId
    where O.Name = "Learn MongoDB"

!SLIDE bullets
# Real-time Analytics
* Upset + $inc
* Fire and forget
* Write heavy
* Flexible reporting

!SLIDE center
<iframe src="http://player.vimeo.com/video/11613517" width="800" height="600" frameborder="0"></iframe>
