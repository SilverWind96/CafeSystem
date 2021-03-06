USE [master]
GO
/****** Object:  Database [Cafe]    Script Date: 8/1/2020 11:47:46 AM ******/
CREATE DATABASE [Cafe]
GO
ALTER DATABASE [Cafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cafe] SET RECOVERY FULL 
GO
ALTER DATABASE [Cafe] SET  MULTI_USER 
GO
ALTER DATABASE [Cafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cafe] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cafe', N'ON'
GO
ALTER DATABASE [Cafe] SET QUERY_STORE = OFF
GO
USE [Cafe]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/1/2020 11:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 8/1/2020 11:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[Items] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[short_description] [nvarchar](200) NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 8/1/2020 11:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[user_id] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[user_position] [bit] NOT NULL,
	[display_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_details]    Script Date: 8/1/2020 11:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_details](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_Order_details] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/1/2020 11:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[tbl_id] [int] NOT NULL,
	[user_id] [nvarchar](20) NOT NULL,
	[created] [datetime] NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (1, N'Coffee')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (2, N'Tea')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (3, N'Smoothie')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (4, N'Ice Cream')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (5, N'Juice')
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (1, N'Black Coffee', 20000, N'Coffee with no add-on', 1)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (2, N'Milk Coffee', 20000, N'Black coffee with milk', 1)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (3, N'Espresso', 25000, N'Strong coffee', 1)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (4, N'Americano', 25000, N'Water and espresso', 1)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (5, N'Latte', 30000, N'coffee drink made with espresso and steamed milk', 1)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (6, N'Coconut Coffee', 30000, N'Coffee with coconut milk', 1)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (7, N'Black Tea', 15000, N'Tea with no add-on', 2)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (8, N'Mint Tea', 20000, N'Tea with mint extract', 2)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (9, N'Milk Tea', 20000, N'Tea with condensed milk', 2)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (10, N'Minty Milk Tea', 25000, N'Tea with milk and mint extract', 2)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (11, N'Bubble Milk Tea', 25000, N'Milk tea with tapioca', 2)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (12, N'Peach Tea', 20000, N'Tea with peach slices', 2)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (13, N'Watermelon Smoothie', 20000, N'Watermelon blend with milk', 3)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (14, N'Mango Smoothie', 20000, N'Mango blend with milk', 3)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (15, N'Blueberry Smoothie', 20000, N'Blueberry blend with milk', 3)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (16, N'Kiwi Smoothie', 20000, N'Kiwi blend with milk', 3)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (17, N'Strawberry Smoothie', 20000, N'Strawberry blend with milk', 3)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (18, N'Matcha Smoothie', 20000, N'Milk blend with matcha powder ', 3)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (19, N'Double Sundae', 30000, N'2 Scoop of vanilla ice cream with toppings', 4)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (20, N'Banana Split', 30000, N'2 Scoop of chocolate ice cream and a peeled banana top with chocolate syrup', 4)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (21, N'Ice Cream Sticky Rice', 30000, N'Ice cream with sticky rice and coconut flakes', 4)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (22, N'Cones', 20000, N'2 scoop of ice cream on a cincamon cone ', 4)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (23, N'Fire and Ice', 30000, N'Hot slice of cake with ice cream on top', 4)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (24, N'Frosty Fruit', 30000, N'Ice cream with fruit slices', 4)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (25, N'Lime Juice', 15000, N'Fresh Lime juice', 5)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (26, N'Orange juice', 15000, N'Fresh Orange juice', 5)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (27, N'Passion Fruit Juice', 15000, N'Fresh Passion Fruit Juice', 5)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (28, N'Guava Juice', 15000, N'Fresh Guava Juice', 5)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (29, N'Pineapple Juice', 15000, N'Fresh Pineapple Juice', 5)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (30, N'Coconut Juice', 15000, N'Fresh Coconut Juice', 5)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (31, N'tra dao', 50000, N'asdac', 2)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (32, N'tra xanh', 20000, N'2 Scoop of chocolate ice cream and a peeled banana', 2)
INSERT [dbo].[Items] ([item_id], [Items], [Price], [short_description], [category_id]) VALUES (33, N'tra sua', 40000, N'Ice cream with fruit slices', 3)
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
INSERT [dbo].[Login] ([user_id], [password], [user_position], [display_name]) VALUES (N'a', N'a', 0, N'ABC')
INSERT [dbo].[Login] ([user_id], [password], [user_position], [display_name]) VALUES (N'b', N'b', 1, N'ADMIN')
INSERT [dbo].[Login] ([user_id], [password], [user_position], [display_name]) VALUES (N'employee1', N'123', 0, N'AnhTGV')
INSERT [dbo].[Login] ([user_id], [password], [user_position], [display_name]) VALUES (N'employee2', N'123', 0, N'VinhNQ')
INSERT [dbo].[Login] ([user_id], [password], [user_position], [display_name]) VALUES (N'manager1', N'123', 1, N'TrongND')
INSERT [dbo].[Login] ([user_id], [password], [user_position], [display_name]) VALUES (N'trong', N'trong', 0, N'Trong')
GO
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (17, 5, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (17, 8, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (17, 9, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (17, 10, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (18, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (18, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (18, 8, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (18, 10, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (19, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (19, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (19, 12, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (19, 18, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (19, 27, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (19, 28, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (19, 30, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (20, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (20, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (20, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (20, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (20, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (21, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (21, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (21, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (21, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (21, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (21, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (21, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (21, 8, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (21, 9, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (22, 25, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (22, 26, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (22, 27, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (22, 28, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (22, 29, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (22, 30, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (23, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (23, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (23, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (23, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (23, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (23, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (23, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (23, 8, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (23, 9, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 8, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 9, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 25, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (24, 26, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (25, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (25, 7, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (25, 9, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 2, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 8, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 9, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 10, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 25, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (26, 26, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (27, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (27, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (27, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (27, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (27, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (27, 7, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (27, 8, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (27, 10, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (28, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (28, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (28, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (28, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (28, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (28, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (28, 10, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (29, 1, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (29, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (29, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (29, 17, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (29, 20, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (30, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (30, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (30, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (30, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (30, 5, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (31, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (31, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (31, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (31, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (32, 1, 1)
GO
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (32, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (32, 4, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (32, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (32, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (33, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (33, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (33, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (33, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (33, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (33, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (34, 1, 7)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (34, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (34, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (34, 14, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (34, 15, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (34, 16, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (34, 18, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (34, 25, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (35, 1, 6)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (35, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (35, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (35, 5, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (35, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (35, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (36, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (36, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (36, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (36, 31, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (37, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (37, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (37, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (37, 32, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (38, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (38, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (38, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (38, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (38, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (38, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (38, 32, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (39, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (39, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (39, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (39, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (39, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (39, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (39, 32, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (40, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (40, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (40, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (40, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (40, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (40, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (40, 32, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (41, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (41, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (41, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (41, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (41, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (41, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (41, 32, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (48, 1, 4)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (48, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (48, 5, 5)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (48, 6, 4)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (48, 23, 6)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (48, 26, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (49, 18, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (50, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (50, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (50, 7, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (51, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (51, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (51, 8, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (51, 9, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (51, 10, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (52, 1, 6)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (53, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (53, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (53, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (53, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (53, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (53, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (54, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (54, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (54, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (54, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (54, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (54, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (55, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (55, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (55, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (55, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (55, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (55, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (56, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (56, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (56, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (56, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (56, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (56, 6, 1)
GO
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (57, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (57, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (57, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (57, 13, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (57, 14, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (57, 15, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (58, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (58, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (58, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (58, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (58, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (58, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (59, 1, 7)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (60, 30, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (60, 31, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (60, 32, 5)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (60, 33, 3)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 1, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 2, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 3, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 4, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 5, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 6, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 7, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 8, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 9, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 10, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 11, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 12, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 13, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 14, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 15, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 16, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 17, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 18, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 19, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 20, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 21, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 22, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 23, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 24, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 25, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 26, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 27, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 28, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 29, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 30, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 31, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 32, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (61, 33, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (62, 33, 100)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (63, 7, 21)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (64, 23, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (64, 24, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (64, 25, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (64, 26, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (64, 27, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (64, 29, 3)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (64, 30, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (64, 31, 3)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (64, 32, 5)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 13, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 18, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 20, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 22, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 24, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 25, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 26, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 27, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 28, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 30, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 32, 8)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (65, 33, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (66, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (66, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (66, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 13, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 14, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 15, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 16, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 17, 3)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 19, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 23, 3)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 26, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 27, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (67, 29, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 10, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 12, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 14, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 16, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 17, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 18, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 20, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 22, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 24, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 26, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 29, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 31, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 32, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (68, 33, 1)
GO
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (69, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (69, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (69, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (70, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (70, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (70, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (71, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (71, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (71, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (72, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (73, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (74, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (74, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (74, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (75, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (76, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (77, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (77, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (78, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (78, 2, 3)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (78, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (79, 2, 3)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (79, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (79, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (80, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (80, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (80, 3, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (80, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (80, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (80, 7, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (80, 9, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (81, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (81, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (81, 4, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (81, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (81, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (81, 8, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (82, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (82, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (82, 5, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (82, 6, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (82, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (82, 8, 7)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (82, 9, 4)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (82, 10, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (82, 11, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (83, 3, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (83, 6, 3)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (83, 8, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (83, 9, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (83, 10, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (83, 11, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (84, 4, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (84, 6, 2)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (84, 7, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (84, 10, 3)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (84, 11, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (84, 12, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (85, 1, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (85, 2, 1)
INSERT [dbo].[Order_details] ([order_id], [item_id], [quantity]) VALUES (85, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (17, 1, N'a', CAST(N'2020-07-31T20:11:38.687' AS DateTime), 145000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (18, 3, N'a', CAST(N'2020-07-31T20:11:47.347' AS DateTime), 95000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (19, 2, N'a', CAST(N'2020-07-31T20:12:17.070' AS DateTime), 135000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (20, 4, N'a', CAST(N'2020-07-31T20:12:55.953' AS DateTime), 135000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (21, 1, N'a', CAST(N'2020-07-31T20:16:08.373' AS DateTime), 210000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (22, 4, N'a', CAST(N'2020-07-31T20:16:26.933' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (23, 1, N'a', CAST(N'2020-07-31T20:16:41.317' AS DateTime), 70000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (24, 1, N'a', CAST(N'2020-07-31T20:18:17.713' AS DateTime), 30000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (25, 2, N'a', CAST(N'2020-07-31T20:18:50.373' AS DateTime), 80000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (26, 1, N'a', CAST(N'2020-07-31T20:20:07.093' AS DateTime), 140000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (27, 1, N'a', CAST(N'2020-07-31T20:24:11.180' AS DateTime), 200000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (28, 2, N'a', CAST(N'2020-07-31T20:24:16.023' AS DateTime), 170000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (29, 6, N'employee1', CAST(N'2020-07-31T20:32:38.310' AS DateTime), 235000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (30, 1, N'a', CAST(N'2020-07-31T20:35:15.060' AS DateTime), 155000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (31, 2, N'a', CAST(N'2020-07-31T20:35:17.943' AS DateTime), 95000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (32, 3, N'a', CAST(N'2020-07-31T20:35:20.443' AS DateTime), 140000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (33, 4, N'a', CAST(N'2020-07-31T20:35:22.717' AS DateTime), 140000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (34, 4, N'a', CAST(N'2020-07-31T20:37:39.090' AS DateTime), 525000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (35, 2, N'a', CAST(N'2020-07-31T20:38:37.407' AS DateTime), 360000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (36, 1, N'a', CAST(N'2020-07-31T20:52:47.397' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (37, 2, N'a', CAST(N'2020-07-31T20:52:50.513' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (38, 2, N'a', CAST(N'2020-07-31T20:53:01.547' AS DateTime), 130000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (39, 2, N'a', CAST(N'2020-07-31T20:54:43.623' AS DateTime), 45000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (40, 2, N'a', CAST(N'2020-07-31T20:55:16.133' AS DateTime), 45000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (41, 2, N'a', CAST(N'2020-07-31T20:55:37.817' AS DateTime), 70000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (42, 1, N'a', CAST(N'2020-07-31T20:58:09.813' AS DateTime), 70000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (43, 1, N'a', CAST(N'2020-07-31T20:58:31.243' AS DateTime), 70000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (44, 1, N'a', CAST(N'2020-07-31T20:59:27.233' AS DateTime), 70000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (45, 1, N'a', CAST(N'2020-07-31T20:59:36.890' AS DateTime), 70000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (46, 1, N'a', CAST(N'2020-07-31T21:00:34.047' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (47, 1, N'a', CAST(N'2020-07-31T21:00:40.783' AS DateTime), 85000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (48, 1, N'trong', CAST(N'2020-07-31T21:04:04.820' AS DateTime), 445000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (49, 6, N'trong', CAST(N'2020-07-31T21:04:20.100' AS DateTime), 20000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (50, 3, N'trong', CAST(N'2020-07-31T21:04:37.203' AS DateTime), 85000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (51, 5, N'trong', CAST(N'2020-07-31T21:04:40.303' AS DateTime), 135000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (52, 6, N'trong', CAST(N'2020-07-31T21:04:43.010' AS DateTime), 150000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (53, 6, N'trong', CAST(N'2020-07-31T21:06:03.243' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (54, 5, N'trong', CAST(N'2020-07-31T21:06:05.610' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (55, 4, N'trong', CAST(N'2020-07-31T21:06:08.470' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (56, 1, N'trong', CAST(N'2020-07-31T21:06:11.210' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (57, 2, N'trong', CAST(N'2020-07-31T21:06:14.063' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (58, 3, N'trong', CAST(N'2020-07-31T21:06:17.103' AS DateTime), 120000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (59, 1, N'a', CAST(N'2020-07-31T21:12:49.837' AS DateTime), 1554)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (60, 1, N'employee2', CAST(N'2020-07-31T21:13:35.607' AS DateTime), 65666)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (61, 3, N'employee2', CAST(N'2020-07-31T21:15:48.220' AS DateTime), 1420444)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (62, 5, N'employee2', CAST(N'2020-07-31T21:16:56.993' AS DateTime), 22200)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (63, 1, N'employee2', CAST(N'2020-07-31T21:17:20.670' AS DateTime), 0)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (64, 1, N'a', CAST(N'2020-07-31T21:22:56.270' AS DateTime), 400324996)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (65, 2, N'a', CAST(N'2020-07-31T21:23:55.283' AS DateTime), 800295214)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (66, 2, N'a', CAST(N'2020-07-31T21:24:07.740' AS DateTime), 75000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (67, 6, N'a', CAST(N'2020-07-31T21:25:50.647' AS DateTime), 365000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (68, 6, N'a', CAST(N'2020-07-31T21:26:15.037' AS DateTime), 100285221)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (69, 1, N'a', CAST(N'2020-07-31T21:35:39.400' AS DateTime), 70000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (70, 2, N'a', CAST(N'2020-07-31T21:35:46.853' AS DateTime), 70000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (71, 1, N'a', CAST(N'2020-07-31T22:20:46.493' AS DateTime), 50000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (72, 1, N'a', CAST(N'2020-07-31T22:45:39.913' AS DateTime), 25000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (73, 1, N'a', CAST(N'2020-07-31T22:46:43.620' AS DateTime), 25000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (74, 1, N'a', CAST(N'2020-07-31T22:46:54.677' AS DateTime), 25000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (75, 1, N'a', CAST(N'2020-07-31T22:56:22.537' AS DateTime), 50000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (76, 1, N'a', CAST(N'2020-07-31T22:58:15.647' AS DateTime), 50000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (77, 1, N'a', CAST(N'2020-07-31T23:01:10.157' AS DateTime), 50000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (78, 1, N'a', CAST(N'2020-07-31T23:01:32.613' AS DateTime), 110000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (79, 1, N'a', CAST(N'2020-07-31T23:03:11.850' AS DateTime), 110000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (80, 1, N'a', CAST(N'2020-08-01T00:49:40.953' AS DateTime), 200000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (81, 1, N'a', CAST(N'2020-08-01T00:50:43.600' AS DateTime), 180000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (82, 1, N'a', CAST(N'2020-08-01T07:58:54.830' AS DateTime), 440000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (83, 2, N'a', CAST(N'2020-08-01T08:00:12.837' AS DateTime), 250000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (84, 1, N'a', CAST(N'2020-08-01T09:30:28.713' AS DateTime), 220000)
INSERT [dbo].[Orders] ([order_id], [tbl_id], [user_id], [created], [total]) VALUES (85, 1, N'a', CAST(N'2020-08-01T10:25:59.590' AS DateTime), 65000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Categories]
GO
ALTER TABLE [dbo].[Order_details]  WITH CHECK ADD  CONSTRAINT [FK_Order_details_Items] FOREIGN KEY([item_id])
REFERENCES [dbo].[Items] ([item_id])
GO
ALTER TABLE [dbo].[Order_details] CHECK CONSTRAINT [FK_Order_details_Items]
GO
ALTER TABLE [dbo].[Order_details]  WITH CHECK ADD  CONSTRAINT [FK_Order_details_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_details] CHECK CONSTRAINT [FK_Order_details_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Login] FOREIGN KEY([user_id])
REFERENCES [dbo].[Login] ([user_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Login]
GO
USE [master]
GO
ALTER DATABASE [Cafe] SET  READ_WRITE 
GO
