/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  collection.listRule = ""
  collection.viewRule = ""
  collection.updateRule = ""
  collection.deleteRule = ""

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  collection.listRule = "user.isAdmin = true"
  collection.viewRule = "user.isAdmin = true"
  collection.updateRule = "user.isAdmin = true"
  collection.deleteRule = "user.isAdmin = true"

  return dao.saveCollection(collection)
})
