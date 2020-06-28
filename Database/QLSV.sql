USE [master]
GO
/****** Object:  Database [QLSV]    Script Date: 6/28/2020 11:31:43 AM ******/
CREATE DATABASE [QLSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLSV.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLSV_log.ldf' , SIZE = 4096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLSV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSV] SET  MULTI_USER 
GO
ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLSV] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLSV]
GO
USE [QLSV]
GO
/****** Object:  Sequence [dbo].[sinhvienSeq]    Script Date: 6/28/2020 11:31:43 AM ******/
CREATE SEQUENCE [dbo].[sinhvienSeq] 
 AS [bigint]
 START WITH 1100
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[tentaikhoan] [varchar](50) NOT NULL,
	[matkhau] [varchar](250) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[tentaikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDiem]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDiem](
	[ngaytao] [datetime] NULL CONSTRAINT [DF_tblDiem_ngaytao_1]  DEFAULT (getdate()),
	[nguoitao] [varchar](30) NULL CONSTRAINT [DF_tblDiem_nguoitao_1]  DEFAULT ('admin'),
	[ngaycapnhap] [datetime] NULL CONSTRAINT [DF_tblDiem_ngaycapnhap_1]  DEFAULT (getdate()),
	[nguoicapnhap] [varchar](30) NULL CONSTRAINT [DF_tblDiem_nguoicapnhap_1]  DEFAULT ('admin'),
	[masinhvien] [varchar](50) NOT NULL,
	[malophoc] [bigint] NOT NULL,
	[lanhoc] [int] NULL CONSTRAINT [DF_tblDiem_lanhoc]  DEFAULT ((1)),
	[diemlan1] [float] NULL CONSTRAINT [DF_tblDiem_diemlan1]  DEFAULT ((0)),
	[diemlan2] [float] NULL CONSTRAINT [DF_tblDiem_diemlan2]  DEFAULT ((0)),
 CONSTRAINT [PK_tblDiem] PRIMARY KEY CLUSTERED 
(
	[masinhvien] ASC,
	[malophoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGiaoVien]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGiaoVien](
	[ngaytao] [datetime] NULL CONSTRAINT [DF_tblGiaoVien_ngaytao]  DEFAULT (getdate()),
	[nguoitao] [varchar](30) NULL CONSTRAINT [DF_tblGiaoVien_nguoitao]  DEFAULT ('admin'),
	[ngaycapnhap] [datetime] NULL CONSTRAINT [DF_tblGiaoVien_ngaycapnhap]  DEFAULT (getdate()),
	[nguoicapnhap] [varchar](30) NULL CONSTRAINT [DF_tblGiaoVien_nguoicapnhap]  DEFAULT ('admin'),
	[magiaovien] [int] IDENTITY(1,1) NOT NULL,
	[matkhau] [varchar](50) NULL CONSTRAINT [DF_tblGiaoVien_matkhau]  DEFAULT (N'giaovien'),
	[ho] [nvarchar](10) NOT NULL,
	[tendem] [nvarchar](20) NULL,
	[ten] [nvarchar](30) NOT NULL,
	[gioitinh] [tinyint] NULL,
	[ngaysinh] [date] NULL,
	[dienthoai] [varchar](30) NULL,
	[email] [varchar](150) NULL,
	[diachi] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblGiaoVien] PRIMARY KEY CLUSTERED 
(
	[magiaovien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblLopHoc]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblLopHoc](
	[ngaytao] [datetime] NULL CONSTRAINT [DF_tblDiem_ngaytao]  DEFAULT (getdate()),
	[nguoitao] [varchar](30) NULL CONSTRAINT [DF_tblDiem_nguoitao]  DEFAULT ('admin'),
	[ngaycapnhap] [datetime] NULL CONSTRAINT [DF_tblDiem_ngaycapnhap]  DEFAULT (getdate()),
	[nguoicapnhap] [varchar](30) NULL CONSTRAINT [DF_tblDiem_nguoicapnhap]  DEFAULT ('admin'),
	[malophoc] [bigint] NOT NULL,
	[mamonhoc] [int] NOT NULL,
	[magiaovien] [int] NOT NULL,
	[daketthuc] [tinyint] NULL CONSTRAINT [DF_tblLopHoc_daketthuc]  DEFAULT ((0)),
 CONSTRAINT [PK_tblLopHoc_1] PRIMARY KEY CLUSTERED 
(
	[malophoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMonHoc]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMonHoc](
	[ngaytao] [datetime] NULL CONSTRAINT [DF_tblMonHoc_ngaytao]  DEFAULT (getdate()),
	[nguoitao] [varchar](30) NULL CONSTRAINT [DF_tblMonHoc_nguoitao]  DEFAULT ('admin'),
	[ngaycapnhap] [datetime] NULL CONSTRAINT [DF_tblMonHoc_ngaycapnhap]  DEFAULT (getdate()),
	[nguoicapnhap] [varchar](30) NULL CONSTRAINT [DF_tblMonHoc_nguoicapnhap]  DEFAULT ('admin'),
	[mamonhoc] [int] IDENTITY(1,1) NOT NULL,
	[tenmonhoc] [nvarchar](150) NOT NULL,
	[sotinchi] [int] NULL,
 CONSTRAINT [PK_tblMonHoc] PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSinhVien](
	[ngaytao] [datetime] NULL CONSTRAINT [DF_tblSinhVien_ngaytao]  DEFAULT (getdate()),
	[nguoitao] [varchar](30) NULL CONSTRAINT [DF_tblSinhVien_nguoitao]  DEFAULT ('admin'),
	[ngaycapnhap] [datetime] NULL CONSTRAINT [DF_tblSinhVien_ngaycapnhap]  DEFAULT (getdate()),
	[nguoicapnhap] [varchar](30) NULL CONSTRAINT [DF_tblSinhVien_nguoicapnhap]  DEFAULT ('admin'),
	[masinhvien] [varchar](50) NOT NULL,
	[ho] [nvarchar](10) NOT NULL,
	[tendem] [nvarchar](20) NULL,
	[ten] [nvarchar](50) NOT NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [tinyint] NULL,
	[quequan] [nvarchar](150) NULL,
	[diachi] [nvarchar](150) NULL,
	[dienthoai] [varchar](30) NULL,
	[email] [varchar](150) NULL,
	[matkhau] [varchar](50) NULL DEFAULT ('sinhvien'),
 CONSTRAINT [PK_tblSinhVien] PRIMARY KEY CLUSTERED 
(
	[masinhvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblLopHoc] FOREIGN KEY([malophoc])
REFERENCES [dbo].[tblLopHoc] ([malophoc])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblLopHoc]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblSinhVien] FOREIGN KEY([masinhvien])
REFERENCES [dbo].[tblSinhVien] ([masinhvien])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblSinhVien]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblGiaoVien] FOREIGN KEY([magiaovien])
REFERENCES [dbo].[tblGiaoVien] ([magiaovien])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblDiem_tblGiaoVien]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblLopHoc_tblMonHoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[tblMonHoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblLopHoc_tblMonHoc]
GO
/****** Object:  StoredProcedure [dbo].[allLopHoc]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[allLopHoc]
 @tukhoa nvarchar(50)
as
begin
	select 
		l.malophoc,
			CASE when len(LTRIM(RTrim(g.tendem))) >0 then CONCAT(g.ho,' ',g.tendem,' ',g.ten)
			else concat(g.ho,' ',g.ten) end as gv,
			m.tenmonhoc
		from tblLopHoc l
		inner join tblGiaoVien g on l.magiaovien=g.magiaovien
		inner join tblMonHoc m on l.mamonhoc= m.mamonhoc
		where LOWER(m.tenmonhoc) like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%'
		or LOWER(g.ten) like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%'
		or LOWER(g.tendem) like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%'
		or LOWER(g.ho) like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%'
		or LOWER(CONCAT(g.ho,' ',g.tendem,' ',g.ten)) like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%';
end
GO
/****** Object:  StoredProcedure [dbo].[dangnhap]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[dangnhap]
	@loaitaikhoan varchar(10),
	@taikhoan  varchar(50),
	@matkhau varchar(50)
as
begin
	if @loaitaikhoan ='admin' 
			select* from TaiKhoan
			where tentaikhoan =@taikhoan
			and matkhau=@matkhau;
		else if @loaitaikhoan='gv'  

		select * from tblGiaoVien
		where CONVERT(varchar(50),magiaovien)=@taikhoan
			and matkhau=@matkhau;

		else
			select * from tblSinhVien
			where masinhvien =@taikhoan
			and matkhau=@matkhau;

end
GO
/****** Object:  StoredProcedure [dbo].[deleteSV]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[deleteSV]
	@masinhvien varchar(50)
as
begin
	delete from tblSinhVien  WHERE 
	 masinhvien=@masinhvien
end
GO
/****** Object:  StoredProcedure [dbo].[dkyhoc]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[dkyhoc]
		@masinhvien varchar(50),
		@malophoc bigint
	as
	begin
		
		declare @v_lanhoc int,
				@v_mamonhoc int,
				@v_dadangky int;
		
		select @v_mamonhoc = mamonhoc
		from tblLopHoc
		where malophoc = @malophoc;
		
		select @v_lanhoc = count(*)
		from tblDiem d
		inner join tblLopHoc l on d.malophoc = l.malophoc
		where l.daketthuc = 1 
		and d.masinhvien = @masinhvien
		and l.mamonhoc = @v_mamonhoc;

		
		select @v_dadangky = count(*)
		from tblDiem d
		inner join tblLopHoc l on d.malophoc = l.malophoc
		where l.daketthuc = 0 
		and l.mamonhoc = @v_mamonhoc 
		and d.masinhvien = @masinhvien; 

		
		if @v_dadangky>0 return -1;

		
		set @v_lanhoc = @v_lanhoc + 1;

		
		insert into tblDiem(nguoitao,masinhvien,malophoc,lanhoc)
		values(@masinhvien,@masinhvien,@malophoc,@v_lanhoc);

		
		if @@ROWCOUNT > 0 return 1 else return 0;
	end
GO
/****** Object:  StoredProcedure [dbo].[dsLopChuaDKy]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[dsLopChuaDKy]
	@masinhvien varchar(50)
as
begin
	select
		l.malophoc,		
		l.mamonhoc,
		m.tenmonhoc,
		m.sotinchi,
		case when len(g.tendem)>0 then concat(g.ho,' ',g.tendem,' ',g.ten)
		else concat(g.ho,' ',g.ten) end as gvien
	from tblLopHoc l
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	where l.daketthuc = 0 
	and l.malophoc not in ( select malophoc from tblDiem where masinhvien = @masinhvien);
end
GO
/****** Object:  StoredProcedure [dbo].[InsertGV]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[InsertGV]
	@nguoitao varchar(30),
	@ho nvarchar(10),
	@tendem nvarchar(20),
	@ten nvarchar(10),
	@gioitinh tinyint,
	@ngaysinh date,
	@email varchar(150),
	@dienthoai varchar(30),
	@diachi nvarchar(150)
AS
BEGIN
	insert into tblGiaoVien
	(
		nguoitao,
		ho,tendem,ten,
		gioitinh,ngaysinh,
		dienthoai,email,diachi
	)
	values(
		@nguoitao,
		@ho,@tendem,@ten,
		@gioitinh,@ngaysinh,
		@dienthoai,@email,@diachi
	);
	if @@ROWCOUNT >0 begin return 1 end
		else begin return 0 end;
END
GO
/****** Object:  StoredProcedure [dbo].[insertLopHoc]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[insertLopHoc]
@nguoitao varchar(30),
@mamonhoc int,
@magiaovien int
as
begin
	insert into tblLopHoc(nguoitao,mamonhoc,magiaovien)
	values(@nguoitao,@mamonhoc,@magiaovien);
	if @@ROWCOUNT > 0 begin return 1 end
	else begin return 0 end;
end
GO
/****** Object:  StoredProcedure [dbo].[insertMH]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertMH]
	@nguoitao varchar(30),
	@tenmonhoc nvarchar(150),
	@sotinchi int
AS
BEGIN
	INSERT INTO tblMonHoc
	(
		nguoitao,
		tenmonhoc,
		sotinchi
		)VALUES(
			@nguoitao,
			@tenmonhoc,
			@sotinchi
	);
		if @@ROWCOUNT  > 0 begin return 1 end
		else begin return 0 end;
		
END
GO
/****** Object:  StoredProcedure [dbo].[monDaDky]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[monDaDky]
	@masinhvien varchar(50),
	@tukhoa nvarchar(50) 
as
begin
	set @tukhoa = lower(@tukhoa);
	select 
		l.malophoc,
		m.tenmonhoc,
		case when(len(g.tendem) > 0 ) then concat(g.ho,' ',g.tendem,' ',g.ten)
		else concat(g.ho,' ',g.ten) end as gvien,
		m.sotinchi,
		d.diemlan1,
		d.diemlan2
	from tblDiem d
	inner join tblLopHoc l on d.malophoc = l.malophoc
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	where l.daketthuc = 0 -- môn đã đăng ký <-> lớp đang/chưa mở  => trạng thái kết thúc là 0; nếu trạng thái đã kết thúc = 1 => học phần đã học xong, điểm chác đã xong @@
	and d.masinhvien = @masinhvien
	and lower(m.tenmonhoc) like '%'+@tukhoa+'%';
end
GO
/****** Object:  StoredProcedure [dbo].[selectAllGV]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[selectAllGV]
 @tukhoa nvarchar(50)
AS
begin
	select
	 magiaovien,
	 case
		when len(tendem)>0 then concat(ho,' ',tendem,' ',ten)
		else concat (ho,' ',ten)
		end as hoten,
		case when gioitinh =1 then 'Nam'
		else N'Nữ' end as  gt,
		dienthoai,
		email,
		diachi
	from tblGiaoVien
	where 
		LOWER (concat(ho,' ',tendem,' ',ten)) like '%'+ LOWER(LTRIM(RTrim(@tukhoa)))+ '%'		
	    or dienthoai like '%'+ LOWER(LTRIM(RTrim(@tukhoa)))+ '%'
		or CAST(magiaovien as varchar(30)) like '%'+ LOWER(LTRIM(RTrim(@tukhoa)))+ '%'
		or LOWER(email) like '%'+ LOWER(LTRIM(RTrim(@tukhoa)))+ '%'
		order by ten;
end
GO
/****** Object:  StoredProcedure [dbo].[selectAllMonHoc]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectAllMonHoc]
	@tukhoa nvarchar(30)
AS
BEGIN
	select
	 mamonhoc,
	 tenmonhoc,
	 sotinchi
	from tblMonHoc
	where mamonhoc like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%'
	    or  lower(tenmonhoc) like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%'
		order by tenmonhoc;
END
GO
/****** Object:  StoredProcedure [dbo].[selectGV]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[selectGV]
	@magiaovien int
AS
BEGIN
	SELECT 
		ho,
		tendem,
		ten,
		gioitinh,
		CONVERT(varchar(10),ngaysinh,103) as ngsinh,
		dienthoai,
		email,
		diachi
	from tblGiaoVien
	where magiaovien= @magiaovien;
END
GO
/****** Object:  StoredProcedure [dbo].[selectLopHoc]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[selectLopHoc]
	@malophoc bigint
as
begin 
	select magiaovien,mamonhoc from tblLopHoc where malophoc=@malophoc;
end
GO
/****** Object:  StoredProcedure [dbo].[selectMH]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectMH]
 @mamonhoc int
AS
BEGIN
	select 
		tenmonhoc,
		sotinchi
	from tblMonHoc
		where mamonhoc=@mamonhoc;
END
GO
/****** Object:  StoredProcedure [dbo].[selectSV]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[selectSV]
  @masinhvien varchar(50)
  AS
  BEGIN
		select 
			ho,tendem,ten, convert(varchar(10),ngaysinh,103) as ngsinh,		
				gioitinh,
		      quequan,diachi,dienthoai,email
			from tblSinhVien
			where masinhvien=@masinhvien
  END
GO
/****** Object:  StoredProcedure [dbo].[SellectAllSinhVien]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SellectAllSinhVien]

	@tukhoa nvarchar(50)

 AS
	select 
	masinhvien,
    case
		when LEN(tendem) >0 then 
		  CONCAT (ho,' ',tendem,' ',ten)
		  else CONCAT(ho,' ',ten)
		  end as hoten,
		 convert(varchar(10),ngaysinh,103) as nsinh,
		 CASE
		   when gioitinh =1 then N'Nam'

		   else N'Nữ'
		end as gt,
		 quequan,
		 diachi,
		 dienthoai,
		 email
		 from tblSinhVien
			where 
			LOWER(ho) like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%'
			or LOWER(tendem) like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%'
			or LOWER(ten) like '%'+ LOWER(LTRIM(RTrim(@tukhoa))) + '%'
			or dienthoai like '%'+ LOWER(LTRIM(RTrim(@tukhoa)))+ '%'
			or email like '%'+ LOWER(LTRIM(RTrim(@tukhoa)))+ '%'

		 order by tendem;




GO
/****** Object:  StoredProcedure [dbo].[ThemMoiSV]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ThemMoiSV]
  @HO nvarchar(10),
  @TenDem nvarchar(20),
  @Ten nvarchar(10),
  @Ngaysinh date,
  @Gioitinh tinyint,
  @Quequan nvarchar(150),
  @DiaChi nvarchar(150),
  @DienThoai varchar(30),
  @Email varchar(150)
  
AS
BEGIN
	Insert into tblSinhVien
	(
		masinhvien,
		ho,tendem,ten,
		ngaysinh,gioitinh,
		quequan,diachi,
		dienthoai,email		
	)
	VALUES
	(
		'17SE' + CAST(next value for sinhvienSeq as varchar(30)),
		@HO,@TenDem,@Ten,
		@Ngaysinh,@Gioitinh,
		@Quequan,@DiaChi,
		@DienThoai,@Email
	);

	IF @@ROWCOUNT >0 begin return 1 end 
	else begin return 0 end;
END	
GO
/****** Object:  StoredProcedure [dbo].[tracuudiem]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[tracuudiem]
	@masinhvien varchar(50),
	@tukhoa nvarchar(50) 
as
begin
	set @tukhoa = lower(@tukhoa);
	select 
		m.mamonhoc,
		m.tenmonhoc,
		d.lanhoc,
		case when len(g.magiaovien)>0 then concat(g.ho,' ',g.tendem,' ',g.ten)
		else concat(g.ho,' ',g.ten) end as gvien,
		d.diemlan1,
		d.diemlan2
	from tblDiem d
	inner join tblLopHoc l on d.malophoc = l.malophoc
	inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
	inner join tblGiaoVien g on l.magiaovien = g.magiaovien
	where l.daketthuc = 1
	and d.masinhvien = @masinhvien
	and lower(m.tenmonhoc) like '%'+@tukhoa+'%';
end

GO
/****** Object:  StoredProcedure [dbo].[tracuulop]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tracuulop]
	@magiaovien int,
	@tukhoa nvarchar(50)
as
begin
	set @tukhoa = lower(@tukhoa);--cho toàn bộ kí tự trở thành lowercase/viết thường
	select 
		tb.malophoc,
		tb.mamonhoc,
		tb.tenmonhoc,
		tb.sotinchi,
		count(d.masinhvien) as siso
	from
	(
		select 
			l.malophoc,
			l.mamonhoc,
			m.tenmonhoc,
			m.sotinchi
		from tblLopHoc l
		inner join tblMonHoc m on l.mamonhoc = m.mamonhoc
		where daketthuc = 0
		and magiaovien = @magiaovien
		and lower(m.tenmonhoc) like '%'+@tukhoa+'%' -- tìm kiếm tương đối <--> có chứa từ khóa 
	) as tb inner join tblDiem d on d.malophoc = tb.malophoc
	group by tb.malophoc,tb.mamonhoc,tb.tenmonhoc,
		tb.sotinchi;
end

GO
/****** Object:  StoredProcedure [dbo].[updateGV]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateGV]
 @nguoicapnhap varchar(30),
 @magiaovien int,
 @ho nvarchar(10),
 @tendem nvarchar(20),
 @ten nvarchar(10),
 @gioitinh tinyint,
 @ngaysinh date,
 @dienthoai varchar(30),
 @email varchar (150),
 @diachi nvarchar(150)
 AS
 BEGIN
	update tblGiaoVien
	SET
		nguoicapnhap= @nguoicapnhap,
		ngaycapnhap= getdate(),
		ho=@ho,tendem=@tendem,ten=@ten,
		gioitinh=@gioitinh,ngaysinh=@ngaysinh,
		dienthoai=@dienthoai,email=@email,diachi=@diachi

		where magiaovien=@magiaovien;

 END
GO
/****** Object:  StoredProcedure [dbo].[updatelophoc]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updatelophoc]
	@nguoicapnhap varchar(30),
	@malophoc bigint,
	@magiaovien int,
	@mamonhoc int
as
begin
	update tblLopHoc
	set
		ngaycapnhap = getdate(),
		nguoicapnhap= @nguoicapnhap,
		mamonhoc=@mamonhoc,		
		magiaovien = @magiaovien
	where malophoc = @malophoc;
	if @@ROWCOUNT > 0 return 1 else return 0;
end
GO
/****** Object:  StoredProcedure [dbo].[updateMH]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateMH]
	@nguoicapnhap varchar(30),
	@mamonhoc int,
	@tenmonhoc nvarchar(150),
	@sotinchi int 
AS
BEGIN
	update tblMonHoc
	SET
		nguoicapnhap=@nguoicapnhap,
		ngaycapnhap =GETDATE(),
		tenmonhoc=@tenmonhoc,
		sotinchi=@sotinchi
	WHERE mamonhoc =@mamonhoc;

	if @@ROWCOUNT  > 0 begin return 1 end
		else begin return 0 end;
END 
GO
/****** Object:  StoredProcedure [dbo].[updateSV]    Script Date: 6/28/2020 11:31:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateSV]
	@masinhvien varchar(50),
	@ho nvarchar(10),
	@tendem nvarchar(20),
	@ten nvarchar(10),
	@ngaysinh date,
	@gioitinh tinyint,
	@quequan nvarchar(150),
	@diachi nvarchar(150),
	@dienthoai varchar(30),
	@email varchar(150)
AS
BEGIN
	UPDATE tblSinhVien
	 SET
		ho=@ho,
		tendem=@tendem,
		ten=@ten,
		ngaysinh=@ngaysinh,
		gioitinh=@gioitinh,
		quequan=@quequan,
		diachi=@diachi,
		dienthoai=@dienthoai,
		email=@email
	WHERE  masinhvien=@masinhvien;
	IF @@ROWCOUNT >0 begin return 1 end 
	else begin return 0 end;
END

GO
USE [master]
GO
ALTER DATABASE [QLSV] SET  READ_WRITE 
GO
