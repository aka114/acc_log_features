﻿
#language: ru

@tree
@SmokeTest

Функциональность: Дымовые тесты - Справочники - Печать
# Конфигурация: Бухгалтерия предприятия, редакция 3.0
# Версия: 3.0.161.19

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И Я закрыл все окна клиентского приложения

Сценарий: Печать элемента справочника "Контрагенты" (Контрагенты)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Справочник.Контрагенты КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И НЕ ТекДанныеИсточник.Предопределенный");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Контрагенты"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Контрагенты"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Вывод на печать формы "Конверт"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_Конверт' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_Конверт'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Конверт"" справочника Контрагенты
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Конверт"" справочника Контрагенты
				Тогда открылось окно '*'
				И Я закрываю окно '*'

Сценарий: Печать элемента справочника "Организации" (Организации)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Справочник.Организации КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И НЕ ТекДанныеИсточник.Предопределенный");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Организации"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент справочника Организации"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Вывод на печать формы "Реквизиты"
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ПодменюПечатьОбычное_Реквизиты' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ПодменюПечатьОбычное_Реквизиты'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Реквизиты"" справочника Организации
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось вывести на печать форму ""Реквизиты"" справочника Организации
				Тогда открылось окно '*'
				И Я закрываю окно '*'
