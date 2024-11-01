/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  collection.viewRule = ""

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("dw15go8jb70hgps")

  collection.viewRule = "user.isAdmin = true"

  return dao.saveCollection(collection)
})
