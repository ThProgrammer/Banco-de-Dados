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

#Aula

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
    
    
    select categories.CategoryID as codCat,
			categories.CategoryName as NomeCategoria,
            products.ProductID as CodProd,
            products.ProductName as NomeProd,
            products.UnitPrice as PrecoProd,
			suppliers.CompanyName as NomeCompania
            from products inner join categories
            on products.CategoryID=categories.CategoryID
            inner join suppliers
            on suppliers.SupplierID= products.SupplierID;
            
	#Exercicio1
	
    select orders.CustomerID,
			customers.ContactName,
            orders.OrderID,
            orders.OrderDate,
            orders.ShipVia
            from orders inner join customers
            on orders.CustomerID=customers.CustomerID;
            
	#Exercicio2
    
    select suppliers.SupplierID,
			suppliers.CompanyName,
            suppliers.ContactName,
            products.ProductID,
            products.ProductName,
            products.UnitPrice,
            products.UnitsInStock
            from suppliers inner join products
            on suppliers.SupplierID=products.SupplierID
            order by products.UnitPrice;
    
	
    #Exercicio3
    
    select employees.employeeid,
			employees.FirstName,
            orders.OrderID,
            sum(order_details.unitprice*order_details.Quantity) as ValorPedido,
            count(order_details.OrderID) as quantidadeDeItens,
            orders.orderDate
            from employees inner join orders
            on employees.EmployeeID=orders.EmployeeID
            inner join order_details
            on orders.OrderID=order_details.OrderID
            group by employees.employeeid,
					employees.FirstName,
					orders.OrderID,
                    orders.orderDate;
                    
                    
	#Aula
    
    select customers.CustomerID,
    orders.OrderID,
    orders.OrderDate from customers left outer join orders
    on customers.customerID=orders.customerID;
    
      select customers.CustomerID,
    orders.OrderID,
    orders.OrderDate from orders right outer join customers
    on customers.customerID=orders.customerID;
    
    
    #Exercicio 4
    
    select products.ProductID,
    products.ProductName,
    order_details.OrderID
    from products left outer join order_details
    on products.ProductID=order_details.ProductID
    where order_details.OrderID is null;
    
    select ct.CustomerId,  ct.ContactName, od.OrderID, od.Orderdate
    from customers as ct left outer join orders as od
    on ct.CustomerID = od.CustomerID
    where od.OrderID is null
    
    union
    
    select ct.ContainerID = od.customerID, ct.ContactName, od.OrderID, od.OrderDate
    from customers as ct right outer join orders as od 
    on ct.CustomerID = od.customerID
    where ct.CustomerID is null;
            
    
            
      
    







