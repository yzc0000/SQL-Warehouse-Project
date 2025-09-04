if OBJECT_ID ('silver.crm_cust_info', 'U') is not null	
	drop table silver.crm_cust_info
	
create table silver.crm_cust_info(	
cst_id int,	
cst_key nvarchar(50),	
cst_firstname nvarchar(50),	
cst_lastname nvarchar(50),	
cst_mater_status nvarchar(50),	
cst_gndr nvarchar(50),	
cst_create_date date,
dwh_create_date DATETIME2 DEFAULT GETDATE()
);	
if OBJECT_ID ('silver.crm_prd_info', 'U') is not null	
	drop table silver.crm_prd_info	

create table silver.crm_prd_info (	
	
prd_id int,	
cat_id nvarchar(50),
prd_key nvarchar(50),	
prd_nm nvarchar(50),	
prd_cost int,	
prd_line nvarchar(50),	
prd_start_dt date,	
prd_end_dt date,
dwh_create_date DATETIME2 DEFAULT GETDATE()
)	
if OBJECT_ID ('silver.crm_sales_details', 'U') is not null	
	drop table silver.crm_sales_details
create table silver.crm_sales_details (	
sls_ord_num nvarchar(50),	
sls_prd_key nvarchar(50),	
sls_cust_id int,	
sls_order_dt date,	
sls_ship_dt date,	
sls_due_dt date,	
sls_sales int,	
sls_quantity int,	
sls_price int,
dwh_create_date DATETIME2 DEFAULT GETDATE()
	
)	
if OBJECT_ID ('silver.erp_px_cat_g1v2', 'U') is not null	
	drop table silver.erp_px_cat_g1v2		
create table silver.erp_px_cat_g1v2(	
ID nvarchar(50),	
cat nvarchar(50),	
subcat nvarchar(50),	
maintenance nvarchar(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()

)	
if OBJECT_ID ('silver.erp_cust_az12', 'U') is not null	
	drop table silver.erp_cust_az12
create table silver.erp_cust_az12(	
cid nvarchar(50),
bdate date,	
gen nvarchar(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()

)	
if OBJECT_ID ('silver.erp_loc_a101', 'U') is not null	
	drop table silver.erp_loc_a101		
create table silver.erp_loc_a101(	
cid nvarchar(50),	
cntry nvarchar(50),
dwh_create_date DATETIME2 DEFAULT GETDATE()

)	
