/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  collection.listRule = null
  collection.createRule = null
  collection.deleteRule = null

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  collection.listRule = "user = @collection.users.isAdmin"
  collection.createRule = "user = @collection.users.isAdmin"
  collection.deleteRule = "user = @collection.users.isAdmin"

  return dao.saveCollection(collection)
})
