# Server docs
1. Start your database and edit `/config/db-config.js`
2. In one terminal window: `npm start`
Example request: `curl -X PUT -H "Content-Type: application/json" -d '{"genre":"romance", "is_safe":1}' localhost:3000/admin/genre`

Note: use node version >= 14