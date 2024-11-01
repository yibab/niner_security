/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "pqo03jwi",
    "name": "type",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "General",
        "Lost Item",
        "Car Incident"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "pqo03jwi",
    "name": "type",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "general",
        "lost item",
        "car incident"
      ]
    }
  }))

  return dao.saveCollection(collection)
})
