UpdateItemIconAndDescription::
	farcall UpdateItemDescription
	ld hl, ItemIconPointers
	ld a, [wCurSpecies]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, vTiles2 tile $1d
	lb bc, BANK(NoItemIcon), $9
	call DecompressRequest2bpp
	farcall LoadItemIconPalette
	call SetDefaultBGPAndOBP
	call WaitBGMap
	ret

ItemIconPointers:
    dw NoItemIcon
    dw MasterBallIcon
    dw UltraBallIcon
    dw BrightpowderIcon
    dw GreatBallIcon
    dw PokeBallIcon
    dw LifeOrbIcon
    dw BicycleIcon
    dw MoonStoneIcon
    dw AntidoteIcon
    dw BurnHealIcon
    dw IceHealIcon
    dw AwakeningIcon
    dw ParlyzHealIcon
    dw FullRestoreIcon
    dw MaxPotionIcon
    dw HyperPotionIcon
    dw SuperPotionIcon
    dw PotionIcon
    dw EscapeRopeIcon
    dw RepelIcon
    dw MaxElixerIcon
    dw FireStoneIcon
    dw ThunderStoneIcon
    dw WaterStoneIcon
    dw BigNuggetIcon
    dw HPUpIcon
    dw ProteinIcon
    dw IronIcon
    dw CarbosIcon
    dw LuckyPunchIcon
    dw CalciumIcon
    dw RareCandyIcon
    dw XAccuracyIcon
    dw LeafStoneIcon
    dw MetalPowderIcon
    dw NuggetIcon
    dw PokeDollIcon
    dw FullHealIcon
    dw ReviveIcon
    dw MaxReviveIcon
    dw GuardSpecIcon
    dw SuperRepelIcon
    dw MaxRepelIcon
    dw DireHitIcon
    dw SecretKeyIcon
    dw FreshWaterIcon
    dw SodaPopIcon
    dw LemonadeIcon
    dw XAttackIcon
    dw PomegBerryIcon
    dw XDefendIcon
    dw XSpeedIcon
    dw XSpclAtkIcon
    dw CoinCaseIcon
    dw ItemfinderIcon
    dw ChoiceBandIcon
    dw ExpShareIcon
    dw OldRodIcon
    dw GoodRodIcon
    dw SilverLeafIcon
    dw SuperRodIcon
    dw PPUpIcon
    dw EtherIcon
    dw MaxEtherIcon
    dw ElixirIcon
    dw RedScaleIcon
    dw SecretPotionIcon
    dw ChoiceSpecsIcon
    dw MysteryEggIcon
    dw ClearBellIcon
    dw SilverWingIcon
    dw MoomooMilkIcon
    dw DiplomaIcon
    dw PechaBerryIcon
    dw GoldLeafIcon
    dw SoftSandIcon
    dw SharpBeakIcon
    dw CheriBerryIcon
    dw AspearBerryIcon
    dw RawstBerryIcon
    dw PoisonBarbIcon
    dw KingsRockIcon
    dw PersimBerryIcon
    dw ChestoBerryIcon
    dw RedApricornIcon
    dw TinyMushroomIcon
    dw BigMushroomIcon
    dw SilverPowderIcon
    dw BluApricornIcon
    dw DuskBallIcon
    dw AmuletCoinIcon
    dw YlwApricornIcon
    dw GrnApricornIcon
    dw CleanseTagIcon
    dw MysticWaterIcon
    dw TwistedSpoonIcon
    dw WhtApricornIcon
    dw BlackbeltIcon
    dw BlkApricornIcon
    dw KelpsyBerryIcon
    dw PnkApricornIcon
    dw BlackGlassesIcon
    dw SlowpokeTailIcon
    dw PinkBowIcon
    dw LeekIcon
    dw SmokeBallIcon
    dw NeverMeltIceIcon
    dw MagnetIcon
    dw LumBerryIcon
    dw PearlIcon
    dw BigPearlIcon
    dw EverstoneIcon
    dw SpellTagIcon
    dw RageCandyBarIcon
    dw GSBallIcon
    dw BlueCardIcon
    dw MiracleSeedIcon
    dw ThickClubIcon
    dw FocusBandIcon
    dw XSpclDefIcon
    dw EnergyPowderIcon
    dw EnergyRootIcon
    dw HealPowderIcon
    dw RevivalHerbIcon
    dw HardStoneIcon
    dw LuckyEggIcon
    dw CardKeyIcon
    dw MachinePartIcon
    dw EggTicketIcon
    dw LostItemIcon
    dw StardustIcon
    dw StarPieceIcon
    dw BasementKeyIcon
    dw MuscleBandIcon
    dw EvioliteIcon
    dw QualotBerryIcon
    dw ZincIcon
    dw CharcoalIcon
    dw BerryJuiceIcon
    dw ScopeLensIcon
    dw HondewBerryIcon
    dw GrepaBerryIcon
    dw MetalCoatIcon
    dw DragonFangIcon
    dw TamatoBerryIcon
    dw LeftoversIcon
    dw OldAmberIcon
    dw DomeFossilIcon
    dw HelixFossilIcon
    dw LeppaBerryIcon
    dw DragonScaleIcon
    dw BerserkGeneIcon
    dw PremierBallIcon
    dw BallRelicIcon
    dw MulchIcon
    dw SacredAshIcon
    dw HeavyBallIcon
    dw FlowerMailIcon
    dw LevelBallIcon
    dw LureBallIcon
    dw FastBallIcon
    dw NetBallIcon
    dw LightBallIcon
    dw FriendBallIcon
    dw MoonBallIcon
    dw LoveBallIcon
    dw MachoBraceIcon
    dw WiseGlassesIcon
    dw SunStoneIcon
    dw PolkadotBowIcon
    dw ItemABIcon
    dw UpGradeIcon
    dw OranBerryIcon
    dw SitrusBerryIcon
    dw SquirtBottleIcon
    dw OldSeaMapIcon
    dw ParkBallIcon
    dw RainbowWingIcon
    dw ItemB3Icon
    dw QuickClawIcon
    dw SurfMailIcon
    dw LiteBlueMailIcon
    dw PortraitMailIcon
    dw LovelyMailIcon
    dw EonMailIcon
    dw MorphMailIcon
    dw BlueSkyMailIcon
    dw MusicMailIcon
    dw MirageMailIcon
    dw ItemBeIcon
    dw ItemBfIcon
    dw TmHmIcon

SECTION "Item Icons 1", ROMX
MasterBallIcon: 	INCBIN "gfx/items/master_ball.2bpp.lz"
UltraBallIcon: 		INCBIN "gfx/items/ultra_ball.2bpp.lz"
GreatBallIcon: 		INCBIN "gfx/items/great_ball.2bpp.lz"
PokeBallIcon: 		INCBIN "gfx/items/poke_ball.2bpp.lz"
LifeOrbIcon: 		INCBIN "gfx/items/life_orb.2bpp.lz"
BicycleIcon: 		INCBIN "gfx/items/bicycle.2bpp.lz"
MoonStoneIcon: 		INCBIN "gfx/items/moon_stone.2bpp.lz"
AntidoteIcon:
BurnHealIcon:
IceHealIcon:
AwakeningIcon:
ParlyzHealIcon: 	INCBIN "gfx/items/antidote.2bpp.lz"
FullRestoreIcon:
MaxPotionIcon: 		INCBIN "gfx/items/max_potion.2bpp.lz"
HyperPotionIcon:
SuperPotionIcon:
PotionIcon: 		INCBIN "gfx/items/potion.2bpp.lz"
EscapeRopeIcon: 	INCBIN "gfx/items/escape_rope.2bpp.lz"
RepelIcon:
SuperRepelIcon:
MaxRepelIcon: 		INCBIN "gfx/items/repel.2bpp.lz"
EtherIcon:
MaxEtherIcon:
ElixirIcon:
MaxElixerIcon:		INCBIN "gfx/items/ether.2bpp.lz"
FireStoneIcon:		INCBIN "gfx/items/fire_stone.2bpp.lz"
ThunderStoneIcon:	INCBIN "gfx/items/thunderstone.2bpp.lz"
WaterStoneIcon:		INCBIN "gfx/items/water_stone.2bpp.lz"
BigNuggetIcon:		INCBIN "gfx/items/big_nugget.2bpp.lz"
HPUpIcon:			INCBIN "gfx/items/hp_up.2bpp.lz"
ProteinIcon:
IronIcon:
CarbosIcon:
CalciumIcon:
ZincIcon:			INCBIN "gfx/items/vitamin.2bpp.lz"
LuckyPunchIcon:		INCBIN "gfx/items/lucky_punch.2bpp.lz"
RareCandyIcon:		INCBIN "gfx/items/rare_candy.2bpp.lz"
LeafStoneIcon:		INCBIN "gfx/items/leaf_stone.2bpp.lz"
MetalPowderIcon:
BrightpowderIcon:
SoftSandIcon:
StardustIcon:
SacredAshIcon:		INCBIN "gfx/items/sand.2bpp.lz"
NuggetIcon:			INCBIN "gfx/items/nugget.2bpp.lz"
PokeDollIcon:		INCBIN "gfx/items/poke_doll.2bpp.lz"
FullHealIcon:		INCBIN "gfx/items/full_heal.2bpp.lz"
ReviveIcon:			INCBIN "gfx/items/revive.2bpp.lz"
MaxReviveIcon:		INCBIN "gfx/items/max_revive.2bpp.lz"
XAttackIcon:
XDefendIcon:
XSpeedIcon:
XSpclAtkIcon:
XSpclDefIcon:
XAccuracyIcon:
GuardSpecIcon:
DireHitIcon:		INCBIN "gfx/items/battle_item.2bpp.lz"
FreshWaterIcon:		INCBIN "gfx/items/fresh_water.2bpp.lz"
SodaPopIcon:		INCBIN "gfx/items/soda_pop.2bpp.lz"
LemonadeIcon:		INCBIN "gfx/items/lemonade.2bpp.lz"
PomegBerryIcon:		INCBIN "gfx/items/pomeg_berry.2bpp.lz"
CoinCaseIcon:		INCBIN "gfx/items/coin_case.2bpp.lz"
ItemfinderIcon:		INCBIN "gfx/items/itemfinder.2bpp.lz"
ChoiceBandIcon:		INCBIN "gfx/items/choice_band.2bpp.lz"
ExpShareIcon:		INCBIN "gfx/items/exp_share.2bpp.lz"
OldRodIcon:			INCBIN "gfx/items/old_rod.2bpp.lz"
GoodRodIcon:		INCBIN "gfx/items/good_rod.2bpp.lz"
SuperRodIcon:		INCBIN "gfx/items/super_rod.2bpp.lz"
PPUpIcon:			INCBIN "gfx/items/pp_up.2bpp.lz"
RedScaleIcon:		INCBIN "gfx/items/red_scale.2bpp.lz"
SecretPotionIcon:	INCBIN "gfx/items/secretpotion.2bpp.lz"
ChoiceSpecsIcon:	INCBIN "gfx/items/choice_specs.2bpp.lz"
MysteryEggIcon:		INCBIN "gfx/items/mystery_egg.2bpp.lz"
ClearBellIcon:		INCBIN "gfx/items/clear_bell.2bpp.lz"
SilverWingIcon:		INCBIN "gfx/items/silver_wing.2bpp.lz"
MoomooMilkIcon:		INCBIN "gfx/items/moomoo_milk.2bpp.lz"
DiplomaIcon:		INCBIN "gfx/items/diploma.2bpp.lz"
PechaBerryIcon:		INCBIN "gfx/items/pecha_berry.2bpp.lz"
SilverLeafIcon:
GoldLeafIcon:		INCBIN "gfx/items/leaf.2bpp.lz"
SharpBeakIcon:		INCBIN "gfx/items/sharp_beak.2bpp.lz"
CheriBerryIcon:		INCBIN "gfx/items/cheri_berry.2bpp.lz"
AspearBerryIcon:	INCBIN "gfx/items/aspear_berry.2bpp.lz"
RawstBerryIcon:		INCBIN "gfx/items/rawst_berry.2bpp.lz"
PoisonBarbIcon:		INCBIN "gfx/items/poison_barb.2bpp.lz"
KingsRockIcon:		INCBIN "gfx/items/kings_rock.2bpp.lz"
PersimBerryIcon:	INCBIN "gfx/items/persim_berry.2bpp.lz"
ChestoBerryIcon:	INCBIN "gfx/items/chesto_berry.2bpp.lz"
RedApricornIcon:	INCBIN "gfx/items/apricorn.2bpp.lz"
TinyMushroomIcon:	INCBIN "gfx/items/tinymushroom.2bpp.lz"
BigMushroomIcon:	INCBIN "gfx/items/big_mushroom.2bpp.lz"
SilverPowderIcon:
EnergyPowderIcon:
HealPowderIcon:		INCBIN "gfx/items/powder.2bpp.lz"
BluApricornIcon:	INCBIN "gfx/items/apricorn.2bpp.lz"
DuskBallIcon:		INCBIN "gfx/items/dusk_ball.2bpp.lz"
AmuletCoinIcon:		INCBIN "gfx/items/amulet_coin.2bpp.lz"
YlwApricornIcon:	INCBIN "gfx/items/apricorn.2bpp.lz"
GrnApricornIcon:	INCBIN "gfx/items/apricorn.2bpp.lz"
CleanseTagIcon:		INCBIN "gfx/items/cleanse_tag.2bpp.lz"
MysticWaterIcon:	INCBIN "gfx/items/mystic_water.2bpp.lz"
TwistedSpoonIcon: 	INCBIN "gfx/items/twistedspoon.2bpp.lz"
WhtApricornIcon:	INCBIN "gfx/items/apricorn.2bpp.lz"
BlackbeltIcon: 		INCBIN "gfx/items/black_belt.2bpp.lz"
BlkApricornIcon:	INCBIN "gfx/items/apricorn.2bpp.lz"
KelpsyBerryIcon:	INCBIN "gfx/items/kelpsy_berry.2bpp.lz"
PnkApricornIcon:	INCBIN "gfx/items/apricorn.2bpp.lz"
BlackGlassesIcon: 	INCBIN "gfx/items/blackglasses.2bpp.lz"
SlowpokeTailIcon:	INCBIN "gfx/items/slowpoketail.2bpp.lz"
PinkBowIcon: 		INCBIN "gfx/items/pink_bow.2bpp.lz"
LeekIcon: 			INCBIN "gfx/items/leek.2bpp.lz"
SmokeBallIcon: 		INCBIN "gfx/items/smoke_ball.2bpp.lz"
NeverMeltIceIcon: 	INCBIN "gfx/items/nevermeltice.2bpp.lz"
MagnetIcon: 		INCBIN "gfx/items/magnet.2bpp.lz"
LumBerryIcon:		INCBIN "gfx/items/lum_berry.2bpp.lz"
PearlIcon:			INCBIN "gfx/items/pearl.2bpp.lz"
BigPearlIcon:		INCBIN "gfx/items/big_pearl.2bpp.lz"
EverstoneIcon:		INCBIN "gfx/items/everstone.2bpp.lz"
SpellTagIcon: 		INCBIN "gfx/items/spell_tag.2bpp.lz"
RageCandyBarIcon:	INCBIN "gfx/items/ragecandybar.2bpp.lz"
GSBallIcon:			INCBIN "gfx/items/gs_ball.2bpp.lz"
BlueCardIcon:		INCBIN "gfx/items/blue_card.2bpp.lz"
MiracleSeedIcon:	INCBIN "gfx/items/miracle_seed.2bpp.lz"
ThickClubIcon:		INCBIN "gfx/items/bone.2bpp.lz"
FocusBandIcon:		INCBIN "gfx/items/focus_band.2bpp.lz"
EnergyRootIcon:		INCBIN "gfx/items/energy_root.2bpp.lz"
RevivalHerbIcon:	INCBIN "gfx/items/revival_herb.2bpp.lz"
HardStoneIcon:		INCBIN "gfx/items/hard_stone.2bpp.lz"
LuckyEggIcon: 		INCBIN "gfx/items/lucky_egg.2bpp.lz"
CardKeyIcon:		INCBIN "gfx/items/card_key.2bpp.lz"
MachinePartIcon:	INCBIN "gfx/items/machine_part.2bpp.lz"
EggTicketIcon:		INCBIN "gfx/items/eggticket.2bpp.lz"
LostItemIcon:		INCBIN "gfx/items/lost_item.2bpp.lz"
StarPieceIcon:		INCBIN "gfx/items/star_piece.2bpp.lz"
BasementKeyIcon:	INCBIN "gfx/items/basement_key.2bpp.lz"
MuscleBandIcon:		INCBIN "gfx/items/muscle_band.2bpp.lz"
EvioliteIcon:		INCBIN "gfx/items/eviolite.2bpp.lz"
QualotBerryIcon:	INCBIN "gfx/items/qualot_berry.2bpp.lz"
CharcoalIcon: 		INCBIN "gfx/items/charcoal.2bpp.lz"
BerryJuiceIcon:		INCBIN "gfx/items/berry_juice.2bpp.lz"
ScopeLensIcon: 		INCBIN "gfx/items/scope_lens.2bpp.lz"
HondewBerryIcon:	INCBIN "gfx/items/hondew_berry.2bpp.lz"
GrepaBerryIcon:		INCBIN "gfx/items/grepa_berry.2bpp.lz"
MetalCoatIcon: 		INCBIN "gfx/items/metal_coat.2bpp.lz"
DragonFangIcon: 	INCBIN "gfx/items/dragon_fang.2bpp.lz"
TamatoBerryIcon:	INCBIN "gfx/items/tamato_berry.2bpp.lz"
LeftoversIcon: 		INCBIN "gfx/items/leftovers.2bpp.lz"
OldAmberIcon:		INCBIN "gfx/items/old_amber.2bpp.lz"
DomeFossilIcon:		INCBIN "gfx/items/dome_fossil.2bpp.lz"
HelixFossilIcon:	INCBIN "gfx/items/helix_fossil.2bpp.lz"
LeppaBerryIcon:		INCBIN "gfx/items/leppa_berry.2bpp.lz"
DragonScaleIcon: 	INCBIN "gfx/items/dragon_scale.2bpp.lz"
BerserkGeneIcon: 	INCBIN "gfx/items/berserk_gene.2bpp.lz"
PremierBallIcon:	INCBIN "gfx/items/premier_ball.2bpp.lz"
BallRelicIcon:		INCBIN "gfx/items/gs_ball.2bpp.lz"
MulchIcon:			INCBIN "gfx/items/mulch.2bpp.lz"
HeavyBallIcon:		INCBIN "gfx/items/heavy_ball.2bpp.lz"
FlowerMailIcon:		INCBIN "gfx/items/flower_mail.2bpp.lz"
LevelBallIcon:		INCBIN "gfx/items/level_ball.2bpp.lz"
LureBallIcon:		INCBIN "gfx/items/lure_ball.2bpp.lz"
FastBallIcon:		INCBIN "gfx/items/fast_ball.2bpp.lz"
NetBallIcon:		INCBIN "gfx/items/net_ball.2bpp.lz"
LightBallIcon:		INCBIN "gfx/items/light_ball.2bpp.lz"
FriendBallIcon:		INCBIN "gfx/items/friend_ball.2bpp.lz"
MoonBallIcon:		INCBIN "gfx/items/moon_ball.2bpp.lz"
LoveBallIcon:		INCBIN "gfx/items/love_ball.2bpp.lz"
MachoBraceIcon: 	INCBIN "gfx/items/macho_brace.2bpp.lz"
WiseGlassesIcon:	INCBIN "gfx/items/wise_glasses.2bpp.lz"
SunStoneIcon:		INCBIN "gfx/items/sun_stone.2bpp.lz"
UpGradeIcon: 		INCBIN "gfx/items/upgrade.2bpp.lz"
OranBerryIcon:		INCBIN "gfx/items/oran_berry.2bpp.lz"
SitrusBerryIcon:	INCBIN "gfx/items/sitrus_berry.2bpp.lz"
SquirtBottleIcon:	INCBIN "gfx/items/squirtbottle.2bpp.lz"
OldSeaMapIcon:		INCBIN "gfx/items/old_sea_map.2bpp.lz"
ParkBallIcon:		INCBIN "gfx/items/park_ball.2bpp.lz"
RainbowWingIcon:	INCBIN "gfx/items/rainbow_wing.2bpp.lz"
QuickClawIcon:		INCBIN "gfx/items/quick_claw.2bpp.lz"
SurfMailIcon:
LiteBlueMailIcon:	INCBIN "gfx/items/mail.2bpp.lz"
PortraitMailIcon:	INCBIN "gfx/items/portraitmail.2bpp.lz"
LovelyMailIcon:		INCBIN "gfx/items/lovely_mail.2bpp.lz"
EonMailIcon:		INCBIN "gfx/items/eon_mail.2bpp.lz"
MorphMailIcon:		INCBIN "gfx/items/morph_mail.2bpp.lz"
BlueSkyMailIcon:	INCBIN "gfx/items/bluesky_mail.2bpp.lz"
MusicMailIcon:		INCBIN "gfx/items/music_mail.2bpp.lz"
MirageMailIcon:		INCBIN "gfx/items/mirage_mail.2bpp.lz"
SecretKeyIcon:
PolkadotBowIcon:
ItemABIcon:
ItemB3Icon:
ItemBeIcon:
ItemBfIcon:
NoItemIcon: 		INCBIN "gfx/items/no_item.2bpp.lz"
TmHmIcon:			INCBIN "gfx/items/tm_hm.2bpp.lz"