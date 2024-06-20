#language: ru

@tree

Функционал: Создание 10 элементов справочника Номенклатура

Как Тестировщик я хочу
с помощью цикла создать 10 элементов справочника Номенклатура 
чтобы выполнить практическую работу № 1   

Сценарий: создание 10 элементов справочника Номенклатура
	*Открытие справочника Номенклатура
		И я закрываю все окна клиентского приложения
		Дано Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
	*Создание позиций номенклатуры
		И Я запоминаю значение выражения 'В Вологде' в переменную "Шаг"
		И я делаю 10 раз
			И Я запоминаю значение выражения '$Шаг$ + где' в переменную "Шаг"
			И Я запоминаю значение выражения '"Где?" + " " + $Шаг$' в переменную "Номенклатура"
			И я проверяю или создаю для справочника "Items" объекты:
					| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
					| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6878' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '58791'  | ''            | '$Номенклатура$' | ''                 | ''               | ''               |          |          |          | 0.21     |         |

