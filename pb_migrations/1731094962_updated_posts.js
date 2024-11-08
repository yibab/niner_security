/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("1s6o2k4iaitns2g")

  collection.name = "alerts"

  // remove
  collection.schema.removeField("xjp21h5v")

  // remove
  collection.schema.removeField("xdzt8mhh")

  // remove
  collection.schema.removeField("y1bxszgy")

  // remove
  collection.schema.removeField("0yavn4ly")

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("1s6o2k4iaitns2g")

  collection.name = "posts"

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "xjp21h5v",
    "name": "user_id",
    "type": "relation",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "_pb_users_auth_",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "xdzt8mhh",
    "name": "created_at",
    "type": "date",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": "",
      "max": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "y1bxszgy",
    "name": "location",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Atkins Library"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "0yavn4ly",
    "name": "category",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Lost Item",
        "Security Concern",
        "Other"
      ]
    }
  }))

  return dao.saveCollection(collection)
})
