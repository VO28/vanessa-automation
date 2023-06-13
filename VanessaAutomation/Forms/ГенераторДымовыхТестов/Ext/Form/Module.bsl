﻿&НаКлиенте
Перем Исключения;

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	Если Параметры.Свойство("СоответствиеТекстовСообщений") Тогда
		Если  ТипЗнч(Параметры.СоответствиеТекстовСообщений) = Тип("Соответствие") Тогда 
			СоответствиеТекстовСообщений = Новый ФиксированноеСоответствие(Параметры.СоответствиеТекстовСообщений);
		КонецЕсли; 	
	КонецЕсли;
	
	Если Параметры.Свойство("КаталогГенерированияДымовыхТестов") Тогда 
		КаталогВыходныхФайлов = Параметры.КаталогГенерированияДымовыхТестов; 
	КонецЕсли;
	
	Если Параметры.Свойство("КаталогФайловИсключаемыхОбъектовИзДымовогоТестирования") Тогда
		КаталогФайловИсключений = Параметры.КаталогФайловИсключаемыхОбъектовИзДымовогоТестирования;
	КонецЕсли;
	
	Если Параметры.Свойство("ТолькоИзмененныеОтносительноКонфигурацииПоставщикаДляДымовогоТестирования") Тогда 
		ТолькоИзмененные = Параметры.ТолькоИзмененныеОтносительноКонфигурацииПоставщикаДляДымовогоТестирования;
	КонецЕсли;
	
	Если Параметры.Свойство("ТолькоВведенныеОбъектыДляДымовогоТестирования") Тогда
		ТолькоВведенные = Параметры.ТолькоВведенныеОбъектыДляДымовогоТестирования;	
	КонецЕсли;
	
	Если Параметры.Свойство("ИмяКонфигурацииПоставщика") И Не ПустаяСтрока(Параметры.ИмяКонфигурацииПоставщика) Тогда
		ИмяКонфигурацииПоставщика = Параметры.ИмяКонфигурацииПоставщика;	
	Иначе
		// По умолчанию то же имя конфигураци поставщика, что и основной конфигурации
		ИмяКонфигурацииПоставщика = Метаданные.Имя;
	КонецЕсли;
	
	Если Параметры.Свойство("ПутьНастройкиСценариеДымовыхТестов") Тогда
		ПутьНастройкиСценариеДымовыхТестов = Параметры.ПутьНастройкиСценариеДымовыхТестов;
	КонецЕсли; 
	
	Если Параметры.Свойство("ЯзыкШаговДымовыхТестов") Тогда
		ЯзыкШагов = Параметры.ЯзыкШаговДымовыхТестов;	
	Иначе
		ЯзыкШагов = "ru";	
	КонецЕсли; 
	
	ЗаполнитьТаблицуНастроекПоУмолчанию();
	
КонецПроцедуры 

Процедура ЗаполнитьТаблицуНастроекПоУмолчанию()
	
	ТипыМетаданных = ПолучитьТипыМетаданных();
	
	Для Каждого ТипМетаданных из ТипыМетаданных Цикл
		НСтрокаНастроек = ТаблицаНастроек.Добавить();
		НСтрокаНастроек.ОбъектМетаданных = ТипМетаданных.Значение;
		НСтрокаНастроек.ПредставлениеОбъектаМетаданных = ТипМетаданных.Представление; 
		НСтрокаНастроек.Картинка = ТипМетаданных.Картинка;
		Если ТипМетаданных.Значение = "Справочники" Тогда
			НСтрокаНастроек.ФормаОбъекта = Истина;
			НСтрокаНастроек.ФормаСписка = Истина;
			НСтрокаНастроек.Запись = Истина;
			НСтрокаНастроек.Копирование = Истина;
			НСтрокаНастроек.ВводНаОсновании = Истина;
			НСтрокаНастроек.Печать = Истина;
		ИначеЕсли ТипМетаданных.Значение = "Документы" Тогда
			НСтрокаНастроек.ФормаОбъекта = Истина;
			НСтрокаНастроек.ФормаСписка = Истина;
			НСтрокаНастроек.Запись = Истина;
			НСтрокаНастроек.Копирование = Истина;
			НСтрокаНастроек.ВводНаОсновании = Истина;
			НСтрокаНастроек.Печать = Истина;
		ИначеЕсли ТипМетаданных.Значение = "ЖурналыДокументов" Тогда
			НСтрокаНастроек.ФормаОбъекта = Истина;
		ИначеЕсли ТипМетаданных.Значение = "ПланыВидовХарактеристик" Тогда 
			НСтрокаНастроек.ФормаОбъекта = Истина;
			НСтрокаНастроек.ФормаСписка = Истина;
			НСтрокаНастроек.Запись = Истина;
			НСтрокаНастроек.Копирование = Истина
		ИначеЕсли ТипМетаданных.Значение = "ПланыСчетов" Тогда
			НСтрокаНастроек.ФормаОбъекта = Истина;
			НСтрокаНастроек.ФормаСписка = Истина;
			НСтрокаНастроек.Запись = Истина;
		ИначеЕсли ТипМетаданных.Значение = "ПланыВидовРасчета" Тогда
			НСтрокаНастроек.ФормаОбъекта = Истина;
			НСтрокаНастроек.ФормаСписка = Истина;
			НСтрокаНастроек.Запись = Истина;
			НСтрокаНастроек.Копирование = Истина;
		ИначеЕсли ТипМетаданных.Значение = "Отчеты" Тогда
			НСтрокаНастроек.ФормаОбъекта = Истина;
		ИначеЕсли ТипМетаданных.Значение = "Обработки" Тогда
			НСтрокаНастроек.ФормаОбъекта = Истина;
		ИначеЕсли ТипМетаданных.Значение = "РегистрыСведений" Тогда
			НСтрокаНастроек.ФормаОбъекта = Истина;
			НСтрокаНастроек.ФормаСписка = Истина;
		ИначеЕсли ТипМетаданных.Значение = "РегистрыНакопления" Тогда
			НСтрокаНастроек.ФормаСписка = Истина;
		ИначеЕсли ТипМетаданных.Значение = "РегистрыБухгалтерии" Тогда
			НСтрокаНастроек.ФормаСписка = Истина;
		ИначеЕсли ТипМетаданных.Значение = "РегистрыРасчета" Тогда 
			НСтрокаНастроек.ФормаСписка = Истина;
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

Функция ПолучитьТипыМетаданных() 
	
	ПредсталениеМетаданных = ПолучитьПредставлениеТипаМетаданных();
	
 	ТипыМетаданных = Новый  СписокЗначений;
 	ТипыМетаданных.Добавить("Справочники", 				ПредсталениеМетаданных.s1,,  БиблиотекаКартинок.Справочник);
	ТипыМетаданных.Добавить("Документы", 				ПредсталениеМетаданных.s2,,  БиблиотекаКартинок.Документ);
	ТипыМетаданных.Добавить("ПланыВидовХарактеристик", 	ПредсталениеМетаданных.s4,,  БиблиотекаКартинок.ПланВидовХарактеристик);
	ТипыМетаданных.Добавить("ПланыСчетов", 				ПредсталениеМетаданных.s5,,  БиблиотекаКартинок.ПланСчетов);
	ТипыМетаданных.Добавить("ПланыВидовРасчета", 		ПредсталениеМетаданных.s6,,  БиблиотекаКартинок.ПланВидовРасчета);
	ТипыМетаданных.Добавить("ЖурналыДокументов", 		ПредсталениеМетаданных.s3,,  БиблиотекаКартинок.ЖурналДокументов);
	ТипыМетаданных.Добавить("Отчеты", 					ПредсталениеМетаданных.s7,,  БиблиотекаКартинок.Отчет);
	ТипыМетаданных.Добавить("Обработки", 				ПредсталениеМетаданных.s8,,  БиблиотекаКартинок.Обработка);
	ТипыМетаданных.Добавить("РегистрыСведений", 		ПредсталениеМетаданных.s9,,  БиблиотекаКартинок.РегистрСведений);
	ТипыМетаданных.Добавить("РегистрыНакопления", 		ПредсталениеМетаданных.s10,, БиблиотекаКартинок.РегистрНакопления);
	ТипыМетаданных.Добавить("РегистрыБухгалтерии", 		ПредсталениеМетаданных.s11,, БиблиотекаКартинок.РегистрБухгалтерии);
	ТипыМетаданных.Добавить("РегистрыРасчета", 			ПредсталениеМетаданных.s12,, БиблиотекаКартинок.РегистрРасчета);
	
	Возврат ТипыМетаданных
	
КонецФункции

Функция ПолучитьПредставлениеТипаМетаданных()
	
	ВозвращемыеДанные = Новый  Структура();
	
	Если ЯзыкШагов = "en" Тогда
		ВозвращемыеДанные.Вставить("s1",  "Catalogs");
		ВозвращемыеДанные.Вставить("s2",  "Documents");
		ВозвращемыеДанные.Вставить("s3",  "Document Journals");
		ВозвращемыеДанные.Вставить("s4",  "Charts of characteristic types");
		ВозвращемыеДанные.Вставить("s5",  "Charts of account");
		ВозвращемыеДанные.Вставить("s6",  "Charts of compensation types");
		ВозвращемыеДанные.Вставить("s7",  "Reports");
		ВозвращемыеДанные.Вставить("s8",  "Data processors");
		ВозвращемыеДанные.Вставить("s9",  "Information registers");
		ВозвращемыеДанные.Вставить("s10", "Accumulation registers");
		ВозвращемыеДанные.Вставить("s11", "Accounting registers");
		ВозвращемыеДанные.Вставить("s12", "Calculation registers");
	Иначе	
		ВозвращемыеДанные.Вставить("s1",  "Справочники");
		ВозвращемыеДанные.Вставить("s2",  "Документы");
		ВозвращемыеДанные.Вставить("s3",  "Журналы документов");
		ВозвращемыеДанные.Вставить("s4",  "Планы видов характеристик");
		ВозвращемыеДанные.Вставить("s5",  "Планы счетов");
		ВозвращемыеДанные.Вставить("s6",  "Регистры накопления");
		ВозвращемыеДанные.Вставить("s7",  "Планы счетов");
		ВозвращемыеДанные.Вставить("s8",  "Обработки");
		ВозвращемыеДанные.Вставить("s9",  "Регистры сведений");
		ВозвращемыеДанные.Вставить("s10", "Регистры накопления");
		ВозвращемыеДанные.Вставить("s11", "Регистры бухгалтерии");
		ВозвращемыеДанные.Вставить("s12", "Регистры расчета");
	КонецЕсли;
	
	Возврат ВозвращемыеДанные;	

КонецФункции
#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ТолькоИзмененныеПриИзменении(Элемент)
	
	Элементы.ИмяКонфигурацииПоставщика.Видимость = ТолькоИзмененные;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура СформироватьФайлы(Команда)
	
	ОчиститьСообщения();
    СформироватьФайлыНаКлиенте();
	
КонецПроцедуры 

&НаКлиенте
Процедура СформироватьФайлыНаКлиенте(ВызовЧерезПараметрЗапуска = Ложь) Экспорт
	      
	Если ПустаяСтрока(КаталогВыходныхФайлов) Тогда 
		СообщитьПользователю(Локализовать("Не указан каталог выходных файлов! Дымовые тест не будут сгенирированы."));
		Возврат;
	КонецЕсли;
	
	Если ВызовЧерезПараметрЗапуска Тогда		
		//GenerateSmokeTest
		Если Не ПустаяСтрока(ПутьНастройкиСценариеДымовыхТестов) Тогда 
			ЗагрузитьНастройкиСценариевЗавершение(ПутьНастройкиСценариеДымовыхТестов, новый Структура());
			//ЗагрузитьНастройкиСценариевЗавершение(Истина, ПоместитьВоВременноеХранилище(Новый ДвоичныеДанные(ПутьНастройкиСценариеДымовыхТестов)), ПутьНастройкиСценариеДымовыхТестов, Неопределено);
		КонецЕсли;	
	КонецЕсли;	
		
	СообщитьПользователю(Локализовать("Начало генерирования тестов: ") + ТекущаяДата());
	Исключения = Новый Структура();
	Если Не ЗапрещеныСинхронныеВызовы() Тогда
		//Исключения =  ПолучитьИсключения();
		ЗаполнитьИсключения();
		ФормированиеФайловТестов();
	Иначе
		//Исключения =  ПолучитьИсключенияАсинх();
		ЗаполнитьИсключенияАсинхВызовФормированиеФайловТестов();
	КонецЕсли; 
	
КонецПроцедуры

&НаКлиенте
Процедура ФормированиеФайловТестов()
	МассивДанныхФайловДляЗаписи = Новый Массив();
	
	ВремяНачала = ТекущаяУниверсальнаяДатаВМиллисекундах();
	
	СтруктураПараметров = Новый Структура;
	СтруктураПараметров.Вставить("ТолькоВведенные", ТолькоВведенные);
	
	ТекстСравнения = "";
	Если ТолькоИзмененные Тогда
		ТекстСравнения = ПолучитьФайлИзменныхОбъектов();
		Если ТекстСравнения = Неопределено Тогда
			Возврат;
		КонецЕсли;
	КонецЕсли;
	СтруктураПараметров.Вставить("ТекстСравнения", ТекстСравнения);	
	
	СоотвестствиеНастроек = Новый Соответствие;
	СоотвестствиеНастроек.Вставить(1, "ФормаСписка");
	СоотвестствиеНастроек.Вставить(2, "ФормаОбъекта");
	СоотвестствиеНастроек.Вставить(3, "Запись");
	СоотвестствиеНастроек.Вставить(4, "Копирование");
	СоотвестствиеНастроек.Вставить(5, "ВводНаОсновании");
	СоотвестствиеНастроек.Вставить(6, "Печать");
	
	// Формируем файлы тестов
	Для Каждого СтрокаНастройки ИЗ ТаблицаНастроек Цикл
		
		СтруктураПараметров.Вставить("ВидОбъектаМетаданных", СтрокаНастройки.ОбъектМетаданных);
		
		СчОбъект = Формат(ТаблицаНастроек.Индекс(СтрокаНастройки) + 1, "ЧЦ=2; ЧДЦ=0; ЧС=; ЧН=00; ЧВН=");
		СтруктураПараметров.Вставить("СчОбъектов", СчОбъект);
		СтруктураПараметров.Вставить("МассивИсключений", Исключения[СтрокаНастройки.ОбъектМетаданных]);
		// Получим массив объектов и форм
		Для СчТип = 1 По СоотвестствиеНастроек.Количество() Цикл
			
			ТипТеста = СоотвестствиеНастроек.Получить(СчТип);	
			Если СтрокаНастройки[ТипТеста] Тогда
				
				СтруктураПараметров.Вставить("СчТип", СчТип);
				СтруктураПараметров.Вставить("ТипТеста", ТипТеста);
				
				Текст = СформироватьТекстФайлаПоОбъектамМетаданных(СтруктураПараметров);
				Если Текст.КоличествоСтрок() > 0 Тогда
						
					// Запишем файл
					ПутьЗаписи = КаталогВыходныхФайлов + "\" + СчОбъект + СчТип + "_" + СтруктураПараметров.ВидОбъектаМетаданных + "_" + ТипТеста + ".feature";
					Кодировка = КодировкаТекста.UTF8;
					Попытка
						Если Не ЗапрещеныСинхронныеВызовы() Тогда
							Текст.Записать(ПутьЗаписи, КодировкаТекста.UTF8);
						Иначе	
							Текст.НачатьЗапись(, ПутьЗаписи, Кодировка, );
						КонецЕсли;
					Исключение
						Сообщить(ОписаниеОшибки());
					КонецПопытки; 
					//МассивДанныхФайловДляЗаписи.Добавить(Новый Структура("ТекстФайл, ПутьЗаписи, Кодировка", Текст, КаталогВыходныхФайлов + "\" + СчОбъект + СчТип + "_" + СтруктураПараметров.ВидОбъектаМетаданных + "_" + ТипТеста + ".feature", КодировкаТекста.UTF8)); 
					
				КонецЕсли;
				
			КонецЕсли;
			
		КонецЦикла;
		
	КонецЦикла;
	
	СообщитьПользователю(Локализовать("Генерирование тестов завершено: ") + ТекущаяДата() + " (" + (ТекущаяУниверсальнаяДатаВМиллисекундах() - ВремяНачала)/1000 + " "+ Локализовать("сек.") + ")");
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьИсключения() 
	
	Для Каждого СтрокаНастройки ИЗ ТаблицаНастроек Цикл
		// Прочитаем файл исключений
		НайденныеФайлы = НайтиФайлы(КаталогФайловИсключений, СтрокаНастройки.ОбъектМетаданных + "*.txt", Истина);
		Исключения.Вставить(СтрокаНастройки.ОбъектМетаданных, ПолучитьМассивСтрокИзФайлаИсключений(НайденныеФайлы));
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьИсключенияАсинхВызовФормированиеФайловТестов(ТекСтрока = 0)
	
	Если ТекСтрока >= ТаблицаНастроек.Количество() Тогда 
		//Обошли всю таблицу настроек, больше искать исключения не нужно
		ФормированиеФайловТестов();
		Возврат;
	КонецЕсли; 
	
	ДополнительныеПараметры = Новый Структура("ТекСтрока, ОбъектМетаданных", ТекСтрока, ТаблицаНастроек[ТекСтрока].ОбъектМетаданных);
	ОписаниеОповещ = Новый ОписаниеОповещения("ПолучитьИсключенияОбработкаЗавершения", ЭтотОбъект, ДополнительныеПараметры, "ОбработкаОшибки", ЭтотОбъект);
	НачатьПоискФайлов(ОписаниеОповещ, КаталогФайловИсключений,  ТаблицаНастроек[ТекСтрока].ОбъектМетаданных + "*.txt", Истина);


КонецПроцедуры

&НаКлиенте
Процедура ПолучитьИсключенияОбработкаЗавершения(НайденныеФайлы, ДополнительныеПараметры) Экспорт
	
	Исключения.Вставить(ДополнительныеПараметры.ОбъектМетаданных, ПолучитьМассивСтрокИзФайлаИсключений(НайденныеФайлы));
	ЗаполнитьИсключенияАсинхВызовФормированиеФайловТестов(ДополнительныеПараметры.ТекСтрока + 1);	
	
КонецПроцедуры 

Функция ПолучитьМассивСтрокИзФайлаИсключений(НайденныеФайлы)
	
	// Прочитаем файл исключений
	МассивИсключений = Новый Массив;            
	Для Каждого НайденныйФайл Из НайденныеФайлы Цикл	
		Текст = Новый ЧтениеТекста(НайденныйФайл.ПолноеИмя, КодировкаТекста.UTF8);
		Строка = Текст.ПрочитатьСтроку();
		Пока Строка <> Неопределено Цикл
			Если НЕ ПустаяСтрока(Строка) И НЕ СтрНачинаетсяС(Строка, "//") Тогда
				МассивИсключений.Добавить(СокрЛП(Строка));
			КонецЕсли;
			Строка = Текст.ПрочитатьСтроку();
		КонецЦикла;
	КонецЦикла;

	Возврат МассивИсключений;
	
КонецФункции

&НаКлиенте
Процедура ОбработкаОшибки(ИнформацияОбОшибке, СтандартнаяОбработка, ДополнительныеПараметры) Экспорт
	
	Сообщить("Ошибка поиска файлов: " + КраткоеПредставлениеОшибки(ИнформацияОбОшибке));
	
КонецПроцедуры

&НаСервере
Функция СформироватьТекстФайлаПоОбъектамМетаданных(СтруктураПараметров)

	Возврат РеквизитФормыВЗначение("Объект").СформироватьТекстФайлаПоОбъектамМетаданных(СтруктураПараметров);

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыФункции

&НаКлиенте
Функция ПолучитьФайлИзменныхОбъектов()
	
	////////////////////////////////////////////////////////////
	// Сформируем файл сравнения конфигураций
	
	// Имя файла сравнения	
	ИмяФайла = ПолучитьИмяВременногоФайла("txt");

	// Определим путь к платформе 1С
	КаталогПрограммы = КаталогПрограммы();
	
	// Определим параметры информационной базы
	СтрокаСоединения = СтрокаСоединенияИнформационнойБазы();
	
	ИмяПользователя = ИмяПользователя();
	ПарольПользователя = """""";
	
	КомандаЗапуска = 
		"""" + КаталогПрограммы + "1cv8.exe""" + " DESIGNER " +
		"/IBConnectionString " + """" + СтрЗаменить(СтрокаСоединения,"""", """""") + """ " +
		"/N " + ИмяПользователя + " /P " + ПарольПользователя + " " +
		"/CompareCfg -FirstConfigurationType MainConfiguration -SecondConfigurationType VendorConfiguration -SecondName " + ИмяКонфигурацииПоставщика + " " +
		"-ReportType Brief " +
		"-ReportFormat txt " +
		"-ReportFile " + ИмяФайла + " " +
		"/DisableStartupMessages /DisableStartupDialogs /DisableUnrecoverableErrorMessage";
	
	КодВозврата = 0;
	Попытка
		ЗапуститьПриложение(КомандаЗапуска, , Истина, КодВозврата);
	Исключение
		ТекстОшибки = ОписаниеОшибки();
		Сообщить(ТекстОшибки);
		Возврат Неопределено;
	КонецПопытки;
	
	// Проверим код возврата
	Если КодВозврата <> 0 Тогда
		ТекстОшибки = "Ошибка сравнения конфигураций, КодВозврата=" + КодВозврата + Символы.ПС + "Строка запуска: " + КомандаЗапуска;
		Сообщить(ТекстОшибки);
		Возврат Неопределено;
	КонецЕсли;
	
	// Прочитаем файл сравнения
	ТекстОбъектов = "";
	ЧтениеТекста = Новый ЧтениеТекста(ИмяФайла, КодировкаТекста.ANSI);
	Стр = ЧтениеТекста.ПрочитатьСтроку();
	Пока Стр <> Неопределено Цикл 
		Если Лев(Стр, 3) = "		-" Тогда
			ТекстОбъектов = ТекстОбъектов + Символы.ПС + Стр;
		КонецЕсли;
	    Стр = ЧтениеТекста.ПрочитатьСтроку();
	КонецЦикла;
	ЧтениеТекста.Закрыть();
	
	// Удалим временный файл
	УдалитьФайлы(ИмяФайла);
	
	Возврат ТекстОбъектов;		
	
КонецФункции

#КонецОбласти

&НаКлиенте
Процедура СохранитьНастройкиСценариевВФайл(Команда)  
	
	ОчиститьСообщения();
	
	Состояние(Нстр("ru = 'Выполняется выгрузка настройки cценариев. Пожалуйста, подождите...'"));
	
	АдресФайлаВоВременномХранилище = "";
	СохранитьНастройкиСценариевВФайлНаСервере(АдресФайлаВоВременномХранилище);
	
	Если Не ПустаяСтрока(АдресФайлаВоВременномХранилище) Тогда
		
		ПолучитьФайл(АдресФайлаВоВременномХранилище, "НастройкиСценариев.csv");
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура СохранитьНастройкиСценариевВФайлНаСервере(АдресФайлаВоВременномХранилище)
	
	ТестовыйФайлНастройкиСценариев = Новый ТекстовыйДокумент; 
	
	ТЗНастроек = ТаблицаНастроек.Выгрузить();
	
	//формирование шапки ТЗ в формате csv 	
	ШапкаТаблицыВформатеЦСВ = "";
	Для Каждого Колонка Из ТЗНастроек.Колонки Цикл
		Если Колонка.Имя = "Картинка" Тогда
			Продолжить;
		КонецЕсли;
		ШапкаТаблицыВформатеЦСВ = ШапкаТаблицыВформатеЦСВ + ?(ШапкаТаблицыВформатеЦСВ <> "", ";" + Колонка.Имя, Колонка.Имя); 		
	КонецЦикла;  
	
	ТестовыйФайлНастройкиСценариев.ДобавитьСтроку(ШапкаТаблицыВформатеЦСВ);
	
	//формирование строк ТЗ в формате csv
	Для Каждого Стр Из ТЗНастроек Цикл  
		СтрокаТаблицыВформатеЦСВ  = ""; 
		Для Каждого Колонка Из ТЗНастроек.Колонки Цикл
			Если Колонка.Имя = "Картинка" Тогда
				Продолжить;
			КонецЕсли;
			СтрокаТаблицыВформатеЦСВ = СтрокаТаблицыВформатеЦСВ + ?(СтрокаТаблицыВформатеЦСВ <> "", ";" + Стр[Колонка.Имя], Стр[Колонка.Имя]);			
		КонецЦикла;
		ТестовыйФайлНастройкиСценариев.ДобавитьСтроку(СтрокаТаблицыВформатеЦСВ);
	КонецЦикла;
	
	//запись временно файла на сервере
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла(".csv");
	ТестовыйФайлНастройкиСценариев.Записать(ИмяВременногоФайла);
	
	Файл = Новый Файл(ИмяВременногоФайла);
		
	Если Файл.Существует() Тогда
		//перенос временного файла в хранилище
		ДвоичныеДанные = Новый ДвоичныеДанные(ИмяВременногоФайла);
		АдресФайлаВоВременномХранилище = ПоместитьВоВременноеХранилище(ДвоичныеДанные, УникальныйИдентификатор);
		//удаление временного файла
		УдалитьФайлы(ИмяВременногоФайла);
		
	КонецЕсли;   
	
КонецПроцедуры 

&НаКлиенте
Процедура ЗагрузитьНастройкиСценариевИзФайла(Команда)
	
	Режим = РежимДиалогаВыбораФайла.Открытие;
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(Режим);
	ДиалогОткрытияФайла.Заголовок = "Выберите csv файл";
	ДиалогОткрытияФайла.Фильтр = "csv файл (*.csv)|*.csv";
	Если ЗапрещеныСинхронныеВызовы() Тогда
		ОписаниеОповещения = Вычислить("Новый ОписаниеОповещения(""ЗагрузитьНастройкиСценариевЗавершение"", ЭтаФорма)");
		Выполнить("ДиалогОткрытияФайла.Показать(ОписаниеОповещения)");
	Иначе	
		Если ДиалогОткрытияФайла.Выбрать() Тогда
			//Объект.КаталогФич = ДиалогОткрытияФайла.ПолноеИмяФайла;
			Файл = Новый Файл(ДиалогОткрытияФайла.ПолноеИмяФайла);
			Если Не Файл.Существует() Тогда
				СообщитьПользователю(Локализовать("Файл настройки сценариев не найден!"));
				Возврат;
			КонецЕсли;
			ДвоичныеДанные = Новый ДвоичныеДанные(ДиалогОткрытияФайла.ПолноеИмяФайла);
			АдресФайлаВоВременномХранилище = ПоместитьВоВременноеХранилище(ДвоичныеДанные, УникальныйИдентификатор);
			ЗагрузитьНастройкиСценариевИзФайлаНаСервере(АдресФайлаВоВременномХранилище, "csv");
		Иначе
			Возврат;
		КонецЕсли; 		
	КонецЕсли;  
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьНастройкиСценариевЗавершение(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт//(Результат, Адрес, ВыбранноеИмяФайла, ДополнительныеПараметры) Экспорт
	
	Если ТипЗнч(ВыбранныеФайлы) = Тип("Массив") И ВыбранныеФайлы.Количество() > 0 И Не ПустаяСтрока(ВыбранныеФайлы[0]) Тогда 
		Файл = Новый Файл(ВыбранныеФайлы[0]);
		Если ЗапрещеныСинхронныеВызовы() Тогда 
			ОписаниеОповещСуществованияФайла =  Новый ОписаниеОповещения("ПроверкаСуществованияФайлаНастроекЗавершение", ЭтаФорма, Новый Структура("ВыбранныйФайл", ВыбранныеФайлы[0]));
			Файл.НачатьПроверкуСуществования(ОписаниеОповещСуществованияФайла);
		Иначе
			Если Не Файл.Существует() Тогда
				СообщитьПользователю(Локализовать("Файл настройки сценариев не найден!"));
				Возврат;
			КонецЕсли;
		КонецЕсли;
		ДвоичныеДанные = Новый ДвоичныеДанные(ВыбранныеФайлы[0]);
		АдресФайлаВоВременномХранилище = ПоместитьВоВременноеХранилище(ДвоичныеДанные, УникальныйИдентификатор);
		ЗагрузитьНастройкиСценариевИзФайлаНаСервере(АдресФайлаВоВременномХранилище, "csv");
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПроверкаСуществованияФайлаНастроекЗавершение(Существует, ДополнительныеПараметры) Экспорт

	Если Существует Тогда  
		ДвоичныеДанные = Новый ДвоичныеДанные(ДополнительныеПараметры.ВыбранныйФайл);
		АдресФайлаВоВременномХранилище = ПоместитьВоВременноеХранилище(ДвоичныеДанные, УникальныйИдентификатор);
		ЗагрузитьНастройкиСценариевИзФайлаНаСервере(АдресФайлаВоВременномХранилище, "csv");
	Иначе
		СообщитьПользователю(Локализовать("Файл настройки сценариев не найден!"));
		Возврат;
	КонецЕсли;
	
КонецПроцедуры
	
&НаСервере
Процедура ЗагрузитьНастройкиСценариевИзФайлаНаСервере(АдресФайлаВоВременномХранилище, Расширение)

	ДвоичныеДанные = ПолучитьИзВременногоХранилища(АдресФайлаВоВременномХранилище);
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла(Расширение);
	ДвоичныеДанные.Записать(ИмяВременногоФайла);
		
	ВыполнитьНастройкиСценариевИзФайлаНаСервере(ИмяВременногоФайла);

	Файл = Новый Файл(ИмяВременногоФайла);
	
	Если Файл.Существует() Тогда
		
		УдалитьФайлы(ИмяВременногоФайла);
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура СообщитьПользователю(Текст, ПутьКДанным = "")
	
	ТекстСообщения = Формат(ТекущаяДата(), "ДЛФ=DT") + " " + Текст;
	
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = ТекстСообщения;
	Сообщение.ПутьКДанным = ПутьКДанным;
	Сообщение.Сообщить();
	
КонецПроцедуры   

// Возвращает текст сообщения пользователю с учетом языка, на котором запущен Менеджер тестирования
// 
// Параметры:
// 	Сообщение - Строка
// Возвращаемое значение:
// 	Строка
//
&НаКлиенте
Функция Локализовать(Сообщение) Экспорт

	Если ЗначениеЗаполнено(СоответствиеТекстовСообщений) Тогда
		Значение = СоответствиеТекстовСообщений[Сообщение];
		Если ЗначениеЗаполнено(Значение) Тогда
			Возврат Значение;
		КонецЕсли;
	КонецЕсли;

	Возврат Сообщение;
	
КонецФункции

&НаСервере
Процедура ВыполнитьНастройкиСценариевИзФайлаНаСервере(Знач ИмяФайла)	
	
	ФайлCSV = Новый ТекстовыйДокумент;
   	ФайлCSV.Прочитать(ИмяФайла);
   
	ТЗ = Новый ТаблицаЗначений;
	// Важно! Чтобы в значениях НЕ встречался используемый разделитель
	ИспользуемыйРазделитель = ";";
	
	//*** Если есть шапка таблицы ***
	ШапкаCSV = ФайлCSV.ПолучитьСтроку(1);
	// Чтение и разделение на отдельные значения в массив (по разделителю)
	МассивCSV = СтрРазделить(ШапкаCSV, ИспользуемыйРазделитель);
	//***************************
	
	Для Каждого СтрокаНом Из МассивCSV Цикл
		
		// Удаляем пробелы т.к. в названии столбцов они не допускаются
		ИмяБП = СтрЗаменить(СтрокаНом," ","");
		ТЗ.Колонки.Добавить(ИмяБП,, СтрокаНом);
		
	КонецЦикла;
	
	Для НомерСтроки=2 По ФайлCSV.КоличествоСтрок() Цикл // Если без шапки, то начинаем с первой строчки
		
		// Получаем строку по-порядку
		СтрокаCSV = ФайлCSV.ПолучитьСтроку(НомерСтроки);
		
		// Разделяем с помощью выбранного разделителя каждую строку на столбцы
		МассивCSV = СтрРазделить(СтрокаCSV, ИспользуемыйРазделитель);
		НоваяСтрочка= ТЗ.Добавить();// Добавляем строку в ТЗ
		
		Для НомСтолбца= 1 По МассивCSV.Количество() Цикл
			
			ТекЗначениеCSV = МассивCSV[НомСтолбца-1];
			ИмяКолонкиCSV = ТЗ.Колонки[НомСтолбца-1].Имя;
			НоваяСтрочка[ИмяКолонкиCSV] = ТекЗначениеCSV;
			
		КонецЦикла;
		
	КонецЦикла;
	
	
	Для Каждого Стр Из ТЗ Цикл
		Для Каждого СтрокаНастроек Из ТаблицаНастроек Цикл
			Если Стр.ОбъектМетаданных = СтрокаНастроек.ОбъектМетаданных Тогда
				СтрокаНастроек.ФормаСписка     = Булево(Стр.ФормаСписка);
				СтрокаНастроек.ФормаОбъекта    = Булево(Стр.ФормаОбъекта);
				СтрокаНастроек.Запись          = Булево(Стр.Запись);
				СтрокаНастроек.Копирование     = Булево(Стр.Копирование);
				СтрокаНастроек.ВводНаОсновании = Булево(Стр.ВводНаОсновании);
				СтрокаНастроек.Печать          = Булево(Стр.Печать);	
			КонецЕсли;
		КонецЦикла;	
	КонецЦикла;
	УбратьНеСуществующиеВозможностиОбъектов();
	
КонецПроцедуры

&НаСервере
Процедура УбратьНеСуществующиеВозможностиОбъектов()
	
	Для Каждого Стр из ТаблицаНастроек Цикл
		Если Стр.ОбъектМетаданных = "ЖурналыДокументов" Тогда 
			Стр.ФормаСписка     = Ложь;
			Стр.Запись          = Ложь;
			Стр.Копирование     = Ложь;
			Стр.ВводНаОсновании = Ложь;
			Стр.Печать          = Ложь;
		ИначеЕсли Стр.ОбъектМетаданных = "Отчеты" Тогда
			Стр.ФормаСписка     = Ложь;
			Стр.Запись          = Ложь;
			Стр.Копирование     = Ложь;
			Стр.ВводНаОсновании = Ложь;
			Стр.Печать          = Ложь;
		ИначеЕсли Стр.ОбъектМетаданных = "Обработки" Тогда 
			Стр.ФормаСписка     = Ложь;
			Стр.Запись          = Ложь;
			Стр.Копирование     = Ложь;
			Стр.ВводНаОсновании = Ложь;
			Стр.Печать          = Ложь;
		ИначеЕсли Стр.ОбъектМетаданных = "РегистрыСведений" Тогда
			Стр.Запись          = Ложь;
			Стр.Копирование     = Ложь;
			Стр.ВводНаОсновании = Ложь;
			Стр.Печать          = Ложь;
		ИначеЕсли Стр.ОбъектМетаданных = "РегистрыНакопления" Тогда
			Стр.ФормаОбъекта    = Ложь; 
			Стр.Запись          = Ложь;
			Стр.Копирование     = Ложь;
			Стр.ВводНаОсновании = Ложь;
			Стр.Печать          = Ложь;
		ИначеЕсли Стр.ОбъектМетаданных = "РегистрыБухгалтерии" Тогда
			Стр.ФормаОбъекта    = Ложь;
			Стр.Запись          = Ложь;
			Стр.Копирование     = Ложь;
			Стр.ВводНаОсновании = Ложь;
			Стр.Печать          = Ложь;
		ИначеЕсли Стр.ОбъектМетаданных = "РегистрыРасчета" Тогда
			Стр.ФормаОбъекта    = Ложь;
			Стр.Запись          = Ложь;
			Стр.Копирование     = Ложь;
			Стр.ВводНаОсновании = Ложь;
			Стр.Печать          = Ложь;
		КонецЕсли;
	КонецЦикла; 
	
КонецПроцедуры

&НаКлиенте
Процедура КаталогФайловИсключенийНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	Режим = РежимДиалогаВыбораФайла.ВыборКаталога;
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(Режим);
	ДиалогОткрытияФайла.Каталог = КаталогФайловИсключений;
	Если ЗапрещеныСинхронныеВызовы() Тогда
		ОписаниеОповещения = Новый ОписаниеОповещения("ОбработатьВыборПапкиФайловИсключений", ЭтаФорма);
		ДиалогОткрытияФайла.Показать(ОписаниеОповещения);
	Иначе	
		Если ДиалогОткрытияФайла.Выбрать() Тогда
			КаталогФайловИсключений = ДиалогОткрытияФайла.Каталог + "\";
		Иначе
			Возврат;
		КонецЕсли;
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ОбработатьВыборПапкиФайловИсключений(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт
	
	Если ВыбранныеФайлы = Неопределено Тогда
		Возврат;
	КонецЕсли;	 
	
	КаталогФайловИсключений = ВыбранныеФайлы[0] + "\";

КонецПроцедуры    

&НаКлиенте
Процедура КаталогВыходныхФайловНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	Режим = РежимДиалогаВыбораФайла.ВыборКаталога;
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(Режим);
	ДиалогОткрытияФайла.Каталог = КаталогВыходныхФайлов;
	Если ЗапрещеныСинхронныеВызовы() Тогда
		ОписаниеОповещения = Новый ОписаниеОповещения("ОбработатьВыборПапкиВыходныхФайлов", ЭтаФорма);
		ДиалогОткрытияФайла.Показать(ОписаниеОповещения);
	Иначе	
		Если ДиалогОткрытияФайла.Выбрать() Тогда
			КаталогВыходныхФайлов = ДиалогОткрытияФайла.Каталог + "\";
		Иначе
			Возврат;
		КонецЕсли;
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ОбработатьВыборПапкиВыходныхФайлов(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт
	
	Если ВыбранныеФайлы = Неопределено Тогда
		Возврат;
	КонецЕсли;	 
	
	КаталогВыходныхФайлов = ВыбранныеФайлы[0] + "\";

КонецПроцедуры    

&НаСервереБезКонтекста
Функция ЗапрещеныСинхронныеВызовы()    
	
	СистемнаяИнформация = Новый СистемнаяИнформация;
	
	Версия1БольшеИлиРавно = ВерсияПриложенияБольшеИлиРавнаЧемЗаданная(СистемнаяИнформация.ВерсияПриложения, "8.3.5.1383");
	
	Рез = Версия1БольшеИлиРавно 
		И Вычислить("Метаданные.РежимИспользованияСинхронныхВызововРасширенийИВнешнихКомпонент <> Метаданные.СвойстваОбъектов.РежимИспользованияСинхронныхВызововРасширенийИВнешнихКомпонент.Использовать");
	
	Возврат Рез;  
	
КонецФункции  

&НаКлиентеНаСервереБезКонтекста
Функция ВерсияПриложенияБольшеИлиРавнаЧемЗаданная(Знач Версия1, Знач Версия2)
	
	Массив1 = РазложитьСтрокуВМассивПодстрок(Версия1, ".");
	Массив2 = РазложитьСтрокуВМассивПодстрок(Версия2, ".");
	
	Версия1БольшеИлиРавно = Истина;
	Для Ккк = 0 По Массив1.Количество() - 1 Цикл
		Элем1 = Массив1.Получить(Ккк);
		Элем2 = Массив2.Получить(Ккк);
		
		Если Число(Элем2) > Число(Элем1) Тогда
			Возврат Ложь;
		ИначеЕсли Число(Элем2) < Число(Элем1) Тогда
			Прервать;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Версия1БольшеИлиРавно;
КонецФункции

// Аналог СтрРазделить() для старых версий платформы
// Описание параметров аналогично описанию параметров для СтрРазделить()
&НаКлиентеНаСервереБезКонтекста
Функция РазложитьСтрокуВМассивПодстрок(Знач Строка, Знач Разделитель = ",", Знач ПропускатьПустыеСтроки = Неопределено, 
		Знач ЕстьПоддержкаФункцияРазложитьСтрокуВМассивПодстрок = Ложь)
	
	Результат = Новый Массив;
	
	// для обеспечения обратной совместимости
	Если ПропускатьПустыеСтроки = Неопределено Тогда
		ПропускатьПустыеСтроки = ?(Разделитель = " ", Истина, Ложь);
		Если ПустаяСтрока(Строка) Тогда 
			Если Разделитель = " " Тогда
				Результат.Добавить("");
			КонецЕсли;
			Возврат Результат;
		КонецЕсли;
	КонецЕсли;

	Если ЕстьПоддержкаФункцияРазложитьСтрокуВМассивПодстрок И СтрДлина(Разделитель) = 1 Тогда
		Если ПропускатьПустыеСтроки = Истина Тогда
			Возврат Вычислить("СтрРазделить(Строка,Разделитель,Ложь)");
		Иначе
			Возврат Вычислить("СтрРазделить(Строка,Разделитель,Истина)");
		КонецЕсли;	 
	КонецЕсли;	 
	
	Позиция = Найти(Строка, Разделитель);
	Пока Позиция > 0 Цикл
		Подстрока = Лев(Строка, Позиция - 1);
		Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Подстрока) Тогда
			Результат.Добавить(Подстрока);
		КонецЕсли;
		Строка = Сред(Строка, Позиция + СтрДлина(Разделитель));
		Позиция = Найти(Строка, Разделитель);
	КонецЦикла;
	
	Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Строка) Тогда
		Результат.Добавить(Строка);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции 



