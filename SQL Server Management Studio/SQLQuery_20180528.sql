
SELECT [學生代號],[學生姓],[學生名],[城市],[班級],[總成績等級]
FROM [dbo].[學生]
WHERE [城市]='SEATTLE'

select count(*) as 人數
from[dbo].[學生]
where [城市]='SEATTLE'

select  [城市], count([學生代號]) as 每個城市的居住人數
from [dbo].[學生]
group by [城市]

select [學生代號],[學生姓],[學生名],[城市],[班級]
from [dbo].[學生]
where [總成績等級]>=3
order by [學生姓] asc

select [課程代號],[科目描述],[教師姓],[教師名],[開課學期],[開課年份],[科目學分數]
from [dbo].[科目],[dbo].[課程],[dbo].[教師]
where [dbo].[科目].科目代號=[dbo].[課程].科目代號 and 
		[dbo].[課程].教師代號=[dbo].[教師].教師代號 and 
		[開課學期]='winter'and [開課年份]=2003

select distinct [dbo].[學生].[學生代號],[學生姓],[學生名]
from [dbo].[學生],[dbo].[選修],[dbo].[課程],[dbo].[教師]
where [學生].學生代號=[選修].學生代號 and 
		[選修].課程代號=[課程].課程代號 and 
		[課程].教師代號=[教師].教師代號 and  
      [教師姓]='Leonard' and [教師名]='Vince'

select distinct T1.[教師代號],T1.[教師姓],T1.[教師名],T1.[薪資]
from [dbo].[教師] T1,[dbo].[教師] T2
where T1.上級老闆=T2.教師代號 and T1.[薪資]>T2.[薪資]

select [課程代號],[教師姓],[教師名],[開課學期],[開課年份]
from[dbo].[教師]full join [dbo].[課程]
on [教師].[教師代號]=[課程].[教師代號]