﻿/////////////////////////////////////////////////////////////////////////
//
// OneScript Package Manager
// Модуль сборки архива пакета
//
/////////////////////////////////////////////////////////////////////////

#Использовать tempfiles

Перем РабочийКаталог;

Процедура СобратьПакет(Знач КаталогИсходников, Знач ФайлМанифеста, Знач ВыходнойКаталог) Экспорт

	РабочийКаталог = КаталогИсходников;
	
	УточнитьФайлМанифеста(ФайлМанифеста);
	Манифест = ПрочитатьМанифест(ФайлМанифеста);
	СобратьПакетВКаталогеСборки(Манифест, ВыходнойКаталог);

КонецПроцедуры

Процедура УточнитьФайлМанифеста(ФайлМанифеста)
	
	Если ФайлМанифеста = Неопределено Тогда
		
		ФайлОбъект = Новый Файл(ОбъединитьПути(РабочийКаталог, "package-def.os"));
		Если ФайлОбъект.Существует() и ФайлОбъект.ЭтоФайл() Тогда
			Сообщить("Найден файл манифеста");
			ФайлМанифеста = ФайлМанифеста.ПолноеИмя;
		Иначе
			ВызватьИсключение "Не определен манифест пакета";
		КонецЕсли;
	Иначе
		Сообщить("Использую файл манифеста " + ФайлМанифеста);
	КонецЕсли;
	
КонецПроцедуры

Функция ПрочитатьМанифест(Знач ФайлМанифеста)
	
	ОписаниеПакета = ЗагрузитьСценарий(ОбъединитьПути(ТекущийСценарий().Каталог, "package-def.os"));
	Сообщить("Загружаю манифест...");
	Манифест = ЗагрузитьСценарий(ФайлМанифеста);
	Манифест.ЗаполнитьОписаниеПакета(Знач ОписаниеПакета);
	Сообщить("Описание пакета прочитано");
	
КонецФункции

Процедура СобратьПакетВКаталогеСборки(Знач Манифест, Знач ВыходнойКаталог)
	
	Если ВыходнойКаталог = Неопределено Тогда
		ВыходнойКаталог = ТекущийКаталог();
	КонецЕсли;
	
	КаталогСборки = ВременныеФайлы.СоздатьКаталог();
	
	
	
КонецПроцедуры