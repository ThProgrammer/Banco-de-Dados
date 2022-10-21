use northwind;

select  * from orders;

select * from order_details;

select * from products;

select  * from orders order by CustomerID asc;

select  CustomerID as CodigoCliente, count(CustomerID) as QTDPedidos
from orders  
group by CustomerID 
order by CustomerID asc;

select CategoryID, count(ProductID)
from products
group by CategoryID;

#exercicio1

select  EmployeeID as CodigoFuncionario, count(OrderID) as QTDPedidos
from orders  
group by EmployeeID
order by EmployeeID asc;

#exercicio2

select  OrderID as CodigoPedido, count(ProductID) as QTDProduto
from order_details  
group by OrderID
order by OrderID asc;

#exercicio3

select shipvia as Empresa, count(OrderID) as QTDPedidos
from orders
group by shipvia
order by count(OrderID) desc;

#exercicio4

select supplierID, count(ProductID)
from products
group by SupplierID;

select orderID,
		productID,
        quantity,
        UnitPrice,
        (Quantity*UnitPrice)
from order_details;

select orderID,
	   sum((Quantity*UnitPrice)) as CustoCadaPedido
from order_details
group by OrderID;

select 	orders.CustomerID, 
		orders.orderId, 
		sum((order_details.Quantity * order_details.UnitPrice)) as CustoCadaPedido
from orders inner join order_details
	on orders.OrderID=order_details.OrderID
    group by orders.CustomerID, orders.OrderID;
    
    select 	orders.CustomerID, 
		sum((order_details.Quantity * order_details.UnitPrice)) as CustoCadaPedido
from orders inner join order_details
	on orders.OrderID=order_details.OrderID
    group by orders.CustomerID;








