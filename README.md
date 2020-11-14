# Server docs
1. Run `npm install` in the root project directory
2. Populate your database with `source animeSQLGeneric.sql` and add MySQL credentials to `/config/db-config.js`
3. Run `npm start` 

Example PUT: `curl -X PUT -H "Content-Type: application/json" -d '{"genre":"romance", "is_safe":1}' localhost:3000/admin/genre`

Note: use node version >= 14

# Client docs
