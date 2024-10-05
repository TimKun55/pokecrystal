	object_const_def
	const GOLDENRODFLOWERSHOPGARDEN_FRUIT_TREE1
	const GOLDENRODFLOWERSHOPGARDEN_FRUIT_TREE2
	const GOLDENRODFLOWERSHOPGARDEN_FRUIT_TREE3
	const GOLDENRODFLOWERSHOPGARDEN_FRUIT_TREE4
	const GOLDENRODFLOWERSHOPGARDEN_FRUIT_TREE5
	const GOLDENRODFLOWERSHOPGARDEN_FRUIT_TREE6

GoldenrodFlowerShopGarden_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodFlowerShopGardenFruitTree1:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_1

GoldenrodFlowerShopGardenFruitTree2:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_2

GoldenrodFlowerShopGardenFruitTree3:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_3

GoldenrodFlowerShopGardenFruitTree4:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_4

GoldenrodFlowerShopGardenFruitTree5:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_5

GoldenrodFlowerShopGardenFruitTree6:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_6

GoldenrodFlowerShopGarden_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  8, GOLDENROD_FLOWER_SHOP, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenFruitTree1, -1
	object_event  8,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenFruitTree2, -1
	object_event 10,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenFruitTree3, -1
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenFruitTree4, -1
	object_event  9,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenFruitTree5, -1
	object_event 11,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenFruitTree6, -1
	