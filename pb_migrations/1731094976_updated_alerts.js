/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("1s6o2k4iaitns2g")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "pnjhs3wq",
    "name": "alert_description",
    "type": "text",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("1s6o2k4iaitns2g")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "pnjhs3wq",
    "name": "item_description",
    "type": "text",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
})
