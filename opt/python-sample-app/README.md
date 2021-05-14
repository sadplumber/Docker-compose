# python-sample-app

Sample Python application on Flask with PostgreSQL database

Deployment
---

* install Python 3.6
* install libs `pip install -r requirements.txt`
* set flask environment `export FLASK_APP=app.py`
* set DB environment `export POSTGRESQL_URL=postgresql://worker:worker@localhost/app`
* migrate database `flask db upgrade`
* start application `python3 app.py` (app listen on `0.0.0.0:5000`)

API information
---

**Show users: `GET /api/user`**

* **URL**

  `/api/user`

* **Method**

  `GET`

* **URL Params**

  None

* **Data Params**

  None

* **Success Response**

  * **Code:** 200 <br />
    **Content:**

    ```[{"id": 1,"username": "user123", "email": "user@example.com","password_hash": "example"}]```

* **Error Response**

  None

* **Sample Call**

  `curl -i -X GET http://127.0.0.1:5000/api/user`

**Create user: `POST /api/user`**

* **URL**

  `/api/user`

* **Method**

  `POST`

*  **URL Params**

   None

* **Data Params**

  JSON with required fields: `username`, `email`, `password_hash`

* **Success Response**

  * **Code:** 200 <br />
    **Content:** `{ "id" : 12, "username" : "user123",  "email": "user@example.com", "password_hash": "example"}`

* **Error Response**

  * **Code:** 400 Bad Request <br />
    **Content:** `validate error`

* **Sample Call**

  `curl -i -X POST -d '{ "username": "user123", "email": "user@example.com", "password_hash": "example" }' -H "Content-Type: application/json" http://127.0.0.1:5000/api/user`


License
---

MIT / BSD

Author Information
---

This app was created in 2019 by [Maxim Baranov](https://github.com/mbaran0v).
