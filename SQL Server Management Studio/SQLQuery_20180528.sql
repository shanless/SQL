
SELECT [�ǥͥN��],[�ǥͩm],[�ǥͦW],[����],[�Z��],[�`���Z����]
FROM [dbo].[�ǥ�]
WHERE [����]='SEATTLE'

select count(*) as �H��
from[dbo].[�ǥ�]
where [����]='SEATTLE'

select  [����], count([�ǥͥN��]) as �C�ӫ������~��H��
from [dbo].[�ǥ�]
group by [����]

select [�ǥͥN��],[�ǥͩm],[�ǥͦW],[����],[�Z��]
from [dbo].[�ǥ�]
where [�`���Z����]>=3
order by [�ǥͩm] asc

select [�ҵ{�N��],[��شy�z],[�Юv�m],[�Юv�W],[�}�ҾǴ�],[�}�Ҧ~��],[��ؾǤ���]
from [dbo].[���],[dbo].[�ҵ{],[dbo].[�Юv]
where [dbo].[���].��إN��=[dbo].[�ҵ{].��إN�� and 
		[dbo].[�ҵ{].�Юv�N��=[dbo].[�Юv].�Юv�N�� and 
		[�}�ҾǴ�]='winter'and [�}�Ҧ~��]=2003

select distinct [dbo].[�ǥ�].[�ǥͥN��],[�ǥͩm],[�ǥͦW]
from [dbo].[�ǥ�],[dbo].[���],[dbo].[�ҵ{],[dbo].[�Юv]
where [�ǥ�].�ǥͥN��=[���].�ǥͥN�� and 
		[���].�ҵ{�N��=[�ҵ{].�ҵ{�N�� and 
		[�ҵ{].�Юv�N��=[�Юv].�Юv�N�� and  
      [�Юv�m]='Leonard' and [�Юv�W]='Vince'

select distinct T1.[�Юv�N��],T1.[�Юv�m],T1.[�Юv�W],T1.[�~��]
from [dbo].[�Юv] T1,[dbo].[�Юv] T2
where T1.�W�Ŧ���=T2.�Юv�N�� and T1.[�~��]>T2.[�~��]

select [�ҵ{�N��],[�Юv�m],[�Юv�W],[�}�ҾǴ�],[�}�Ҧ~��]
from[dbo].[�Юv]full join [dbo].[�ҵ{]
on [�Юv].[�Юv�N��]=[�ҵ{].[�Юv�N��]