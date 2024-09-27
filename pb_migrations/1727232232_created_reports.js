/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "dw15go8jb70hgps",
    "created": "2024-09-25 02:43:52.707Z",
    "updated": "2024-09-25 02:43:52.707Z",
    "name": "reports",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "3tmjlzih",
        "name": "user",
        "type": "relation",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "collectionId": "_pb_users_auth_",
          "cascadeDelete": false,
          "minSelect": null,
          "maxSelect": 1,
          "displayFields": null
        }
      },
      {
        "system": false,
        "id": "783ynwey",
        "name": "report",
        "type": "text",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      }
    ],
    "indexes": [],
    "listRule": "user = @request.auth.id",
    "viewRule": "user = @request.auth.id",
    "createRule": "user = @request.auth.id",
    "updateRule": null,
    "deleteRule": "user = @request.auth.id",
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps");

  return dao.deleteCollection(collection);
})
