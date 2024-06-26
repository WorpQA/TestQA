﻿#language: ru

@tree
@ExportScenarios

Функционал: _0402 Тестирование отображения возвратов в отчете D2001 Продажи

Как Тестировщик я хочу
протестировать отображение возвратов в отчете D2001 Продажи 
чтобы выполнить практическое задание № 2   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Тестирование отображения возвратов в отчете D2001 Продажи
	*Формирование отчета D2001
		Когда экспорт основных данных
		И я закрываю все окна клиентского приложения
		Дано Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
		Когда открылось окно 'D2001 Продажи'
		И я нажимаю на кнопку с именем 'FormGenerate'
		Тогда табличный документ "Result" равен:
			| 'Параметры:'               | 'Период: 01.06.2024 - 30.06.2024'                                   | ''          | ''                  | ''             |
			| 'Отбор:'                   | 'Вид мультивалютной аналитики Равно "ru наименование не заполнено"' | ''          | ''                  | ''             |
			| ''                         | ''                                                                  | ''          | ''                  | ''             |
			| 'Период, месяц'            | 'Итого'                                                             | ''          | ''                  | ''             |
			| 'Номенклатура'             | ''                                                                  | ''          | ''                  | ''             |
			| 'Характеристика'           | 'Количество'                                                        | 'Сумма'     | 'Сумма без налогов' | 'Сумма скидки' |
			| 'Июнь 2024'                | '-7,000'                                                            | '-2 530,00' | '-2 108,33'         | ''             |
			| 'Товар с характеристиками' | '-3,000'                                                            | '-570,00'   | '-475,00'           | ''             |
			| 'S/Красный'                | '-3,000'                                                            | '-570,00'   | '-475,00'           | ''             |
			| 'Товар без характеристик'  | '-4,000'                                                            | '-1 960,00' | '-1 633,33'         | ''             |
			| 'Товар без характеристик'  | '-4,000'                                                            | '-1 960,00' | '-1 633,33'         | ''             |
			| 'Итого'                    | '-7,000'                                                            | '-2 530,00' | '-2 108,33'         | ''             |
	*Внесение изменений в базу данных	
		И я закрываю все окна клиентского приложения
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesReturn"
		И я нажимаю на кнопку с именем 'FormCreate'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'       |
			| '12'  | 'Розничный клиент 1' |
		И я нажимаю на кнопку с именем 'FormChoose'
		Когда открылось окно 'Возврат товаров от покупателя (создание) *'
		И я нажимаю кнопку выбора у поля с именем "Company"
		Тогда открылось окно 'Организации'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'           |
			| '1'   | 'Собственная компания 1' |
		И я нажимаю на кнопку с именем 'FormChoose'
		Когда открылось окно 'Возврат товаров от покупателя (создание) *'
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItem"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'             | 'Ссылка'                   |
			| '1'   | 'Товар с характеристиками' | 'Товар с характеристиками' |
		И я нажимаю на кнопку с именем 'FormChoose'
		И в таблице "ItemList" я активизирую поле с именем "ItemListItemKey"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItemKey"
		Тогда открылось окно 'Характеристики'
		И в таблице "List" я перехожу к строке:
			| 'Item key'  | 'Код' | 'Номенклатура'             | 'Характеристика' |
			| 'S/Красный' | '1'   | 'Товар с характеристиками' | 'S/Красный'      |
		И я нажимаю на кнопку с именем 'FormChoose'
		И в таблице "ItemList" я активизирую поле с именем "ItemListQuantity"
		И в таблице "ItemList" в поле с именем 'ItemListQuantity' я ввожу текст '5,000'
		И в таблице "ItemList" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormPost'
	*Повторное фомирование отчета D2001
		И я закрываю все окна клиентского приложения		
		Дано Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
		Когда открылось окно 'D2001 Продажи'
		И я нажимаю на кнопку с именем 'FormGenerate'
		Тогда табличный документ "Result" равен:
			| 'Параметры:'               | 'Период: 01.06.2024 - 30.06.2024'                                   | ''          | ''                  | ''             |
			| 'Отбор:'                   | 'Вид мультивалютной аналитики Равно "ru наименование не заполнено"' | ''          | ''                  | ''             |
			| ''                         | ''                                                                  | ''          | ''                  | ''             |
			| 'Период, месяц'            | 'Итого'                                                             | ''          | ''                  | ''             |
			| 'Номенклатура'             | ''                                                                  | ''          | ''                  | ''             |
			| 'Характеристика'           | 'Количество'                                                        | 'Сумма'     | 'Сумма без налогов' | 'Сумма скидки' |
			| 'Июнь 2024'                | '-12,000'                                                           | '-3 670,00' | '-3 058,33'         | ''             |
			| 'Товар с характеристиками' | '-8,000'                                                            | '-1 710,00' | '-1 425,00'         | ''             |
			| 'S/Красный'                | '-8,000'                                                            | '-1 710,00' | '-1 425,00'         | ''             |
			| 'Товар без характеристик'  | '-4,000'                                                            | '-1 960,00' | '-1 633,33'         | ''             |
			| 'Товар без характеристик'  | '-4,000'                                                            | '-1 960,00' | '-1 633,33'         | ''             |
			| 'Итого'                    | '-12,000'                                                           | '-3 670,00' | '-3 058,33'         | ''             |
		
Сценарий: Сверка выгруженного макета со сформированным отчетом D2001
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
		Тогда открылось окно 'D2001 Продажи'
		И я нажимаю на кнопку с именем 'FormGenerate'
		Дано Табличный документ "Result" равен макету "МакетОтчетаПродажи1" по шаблону
		И в табличном документе "Result" ячейка с адресом "R13C3" равна "-3 67*" по шаблону													
	
			
		
			
