select
    substr(email, instr(email, '@') + 1) as domain,
    count(email) as user_count
from users
group by domain
having user_count >= 2