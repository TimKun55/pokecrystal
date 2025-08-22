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

GoldenrodFlowerShopGardenKelpsyTree:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_KELPSY

GoldenrodFlowerShopGardenQualotTree:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_QUALOT

GoldenrodFlowerShopGardenPomegTree:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_POMEG

GoldenrodFlowerShopGardenHondewTree:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_HONDEW

GoldenrodFlowerShopGardenGrepaTree:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_GREPA

GoldenrodFlowerShopGardenTamatoTree:
	fruittree FRUITTREE_GOLDENROD_FLOWER_SHOP_GARDEN_TAMATO

GoldenrodFlowerShopGarden_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 11, GOLDENROD_FLOWER_SHOP, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenKelpsyTree, -1
	object_event  4,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenQualotTree, -1
	object_event  8,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenPomegTree, -1
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenHondewTree, -1
	object_event  5,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenGrepaTree, -1
	object_event  9,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodFlowerShopGardenTamatoTree, -1
	