function add_to_cart(pid, pname, pprice)
{
    let cart = localStorage.getItem("cart");
    if (cart === null)
    {
        //no cart yet
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        //console.log("Product is added for the first time");
        showToast("Item is added to cart");
    } else
    {
        //cart is already exists
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId === pid);
        if (oldProduct)
        {
            //we have to increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId === oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            //console.log("Product quantity is increased");
            showToast(oldProduct.productName+" quantity is increased");
        } else
        {
            //we have to add the quantity
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            //console.log("Product is added");
            showToast("Product is added");
        }
    }
    updateCart();
}


//update cart
function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart === null)
    {
        console.log("cart is empty");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart does not have any items </h3>");
        $(".checkout-btn").attr('disabled',true);
    } else
    {
        //there is something in cart to show
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table = `
                    <table class='table'>
                    <thead class='thead-light'>
                        <tr>
                            <th> Item Name </th>
                            <th> Price </th>
                            <th> Quantity </th>
                            <th> Total Price </th>
                            <th> Action </th>
                        </tr>
                <thead>
                `;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                        <tr>
                            <td> ${item.productName}</td>
                            <td> ${item.productPrice}</td>
                            <td> ${item.productQuantity}</td>
                            <td> ${item.productQuantity * item.productPrice}</td>
                            <td> <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button> </td>
                        </tr>
                    `;

            totalPrice += item.productPrice * item.productQuantity;
        });




        table = table + `
                    <tr><td class='text-right font-weight-bold m-5 text-danger' colspan='5'> Total Price : ${totalPrice}</td></tr>
                    </table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled',false);
    }
}

//deleting item
function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId !== pid);
    localStorage.setItem('cart', JSON.stringify(newcart));
    updateCart();
    
    showToast("Item is removed from cart");
}
$(document).ready(function () {
    updateCart();
});


function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(()=>{
       $("#toast").removeClass("display"); 
    }, 2000);
}


function goToCheckout()
{
    window.location="checkout.jsp";    
}