# Server docs
1. Populate your database and edit `/config/db-config.js`
2. In one terminal window: `npm start` 

Example PUT: `curl -X PUT -H "Content-Type: application/json" -d '{"genre":"romance", "is_safe":1}' localhost:3000/admin/genre`

Note: use node version >= 14
