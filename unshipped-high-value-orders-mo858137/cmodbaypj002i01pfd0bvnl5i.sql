select order_items.order_id, sum(order_items.amount) as 'total_amount' 
from orders
join order_items on order_items.order_id = orders.id
where orders.status = 'pending'
group by orders.id
having total_amount > 100
