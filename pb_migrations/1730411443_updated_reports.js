/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "8gh8hkyl",
    "name": "disposition",
    "type": "select",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Pending Investigation",
        "Investigating",
        "Resolved"
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
    "id": "8gh8hkyl",
    "name": "disposition",
    "type": "select",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "submitted",
        "in progress",
        "completed"
      ]
    }
  }))

  return dao.saveCollection(collection)
})
