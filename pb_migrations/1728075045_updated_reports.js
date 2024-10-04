/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  // remove
  collection.schema.removeField("cutfkzgz")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "lffbaoob",
    "name": "datetime",
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
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "cutfkzgz",
    "name": "datetime",
    "type": "date",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "min": "",
      "max": ""
    }
  }))

  // remove
  collection.schema.removeField("lffbaoob")

  return dao.saveCollection(collection)
})
