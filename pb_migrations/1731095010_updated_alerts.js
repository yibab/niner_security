/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("1s6o2k4iaitns2g")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "gv1gugvt",
    "name": "date_time",
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

  // remove
  collection.schema.removeField("gv1gugvt")

  return dao.saveCollection(collection)
})
