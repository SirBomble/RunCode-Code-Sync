select product, qty, reorder_level
from inventory
where qty < reorder_level