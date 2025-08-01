﻿

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ЭтаФорма.Комментарий = ЭтаФорма.Параметры.Комментарий;
	
	ТекущийВопрос        = ЭтаФорма.Параметры.ТекущийВопрос;
	
	HTMLДоккумент_		 = ТекущийВопрос.HTMLДокумент.Получить();
	
	Если ТипЗнч(HTMLДоккумент_)=Тип("ФорматированныйДокумент") Тогда
			
		HTMLКомментарий	= HTMLДоккумент_;
			
	КонецЕсли; 

КонецПроцедуры


&НаСервере
Процедура ЗаписатьВОбъектHTMLКомментарий()
	
	ТекущийОбъект = ТекущийВопрос.ПолучитьОбъект();
	
	HTMLДокумент				= Новый ХранилищеЗначения(HTMLКомментарий,Новый СжатиеДанных(9));
	ТекущийОбъект.HTMLДокумент	= HTMLДокумент;
	ТекущийОбъект.Записать();
	
КонецПроцедуры

&НаКлиенте
Процедура ОК(Команда)
	
	Если HTMLКомментарий.Элементы.Количество()=0 Тогда
		ЭтаФорма.Закрыть("");
		Возврат;
	КонецЕсли;
	
	Попытка 
		
		ЗаписатьВОбъектHTMLКомментарий();
	
		ЭтаФорма.Закрыть("Комментарий успешно добавлен");
		
	Исключение
		
		ЭтаФорма.Закрыть("Комментарий не добавлен по причине: " + ОписаниеОшибки());
		
	КонецПопытки;
		
КонецПроцедуры



