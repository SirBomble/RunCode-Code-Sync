select user_id, max(login_at) as last_login_at
from logins
group by user_id
