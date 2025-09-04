/*create view gold.fact_sales as*/
select
sd.sls_ord_num order_number,
pr.product_key,
cu.customer_key,
sd.sls_order_dt order_date,
sd.sls_ship_dt shipping_date,
sd.sls_due_dt dute_date,
sd.sls_sales sales_amount,
sd.sls_quantity quantity,
sd.sls_price price
from silver.crm_sales_details sd
left join gold.dim_products pr
on sd.sls_prd_key = pr.product_number
left join gold.dim_customers cu
on sd.sls_cust_id = cu.customer_id
---------------------------------------------------------------------------------------------------------
/*create  view gold.dim_products as */
select
	row_number() over(order by  pr.prd_start_dt,pr.prd_key) as product_key,
	pr.prd_id product_id,
	pr.prd_key product_number,
	pr.prd_nm product_name,
	pr.cat_id category_id,
	px.cat category,
	px.subcat subcategory,
	pr.prd_line product_line,
	pr.prd_cost cost,
	px.maintenance,
	pr.prd_start_dt start_date,
	pr.dwh_create_date

from silver.crm_prd_info pr
left join silver.erp_px_cat_g1v2 px
on pr.cat_id = px.ID
where pr.prd_end_dt is null
------------------------------------------------------------------------------------------------------------
/*create view gold.dim_customers as */
select
	ROW_NUMBER() over(order by cst_id) as customer_key,
	ci.cst_id customer_id,
	ci.cst_key customer_number,
	ci.cst_firstname first_name,
	ci.cst_lastname last_name,
	ci.cst_mater_status maritial_status,
CASE 
	when ci.cst_gndr != 'n/a' and ci.cst_gndr != 'Unknown'
	then ci.cst_gndr
	else coalesce(az.gen, 'n/a')
END as gender,
	loc.cntry country,
	az.bdate birth_date,
	ci.cst_create_date create_date
from silver.crm_cust_info ci
left join silver.erp_loc_a101 loc
on ci.cst_key = loc.cid
left join silver.erp_cust_az12 az
on ci.cst_key = az.cid








