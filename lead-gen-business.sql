Use lead_gen_business;

/*1*/
select  monthname(a.charged_datetime) as month, sum(a.amount) as revenue
from billing a
where a.charged_datetime between '2012/03/01' and '2012/03/31';
/*2*/
select  a.client_id, sum(a.amount) as total_revenue
from billing a
where a.client_id='2';
/*3*/
select  a.domain_name as website , a.client_id
from sites a
where a.client_id='10';
/*4-A*/
select  a.client_id, COUNT(a.domain_name) as number_websites, monthname(a.created_datetime) as mounth_created, year(a.created_datetime) as year_created
from sites a 
where a.client_id='1'
GROUP BY monthname(a.created_datetime), year(a.created_datetime);

/*4-B*/
select  a.client_id, COUNT(a.domain_name) as number_websites, monthname(a.created_datetime) as mounth_created, year(a.created_datetime) as year_created
from sites a 
where a.client_id='20'
GROUP BY monthname(a.created_datetime), year(a.created_datetime);

/*5*/
select b.domain_name as website, COUNT(a.leads_id) as number_of_leads, CONCAT(MONTHNAME(a.registered_datetime)," ",DAY(a.registered_datetime),","," ",YEAR(a.registered_datetime)) as date_generated
from leads a JOIN sites b on a.site_id=b.site_id
where a.registered_datetime between '2011/01/01' and '2011/02/15'
GROUP BY a.leads_id;

/*6*/
select CONCAT(a.first_name," ",a.last_name) as client_name, COUNT(c.leads_id) as number_of_leads
from clients a JOIN sites b on a.client_id=b.client_id JOIN leads c on b.site_id=c.site_id
where c.registered_datetime between '2011/01/01' and '2011/12/31'
GROUP by client_name;

/*7*/
select CONCAT(a.first_name," ",a.last_name) as client_name, COUNT(c.leads_id) as number_of_leads, monthname(c.registered_datetime)
from clients a JOIN sites b on a.client_id=b.client_id JOIN leads c on b.site_id=c.site_id
where c.registered_datetime between '2011/01/01' and '2011/06/30'
GROUP by client_name, c.leads_id
ORDER BY c.registered_datetime;

/*8 A*/
select CONCAT(a.first_name," ",a.last_name) as client_name, b.domain_name, count(b.site_id) number_of_leads, DATE_FORMAT(c.registered_datetime, "%M %d, %Y") as date_generated
from clients a JOIN sites b on a.client_id=b.client_id JOIN leads c on b.site_id=c.site_id
where c.registered_datetime between '2011/01/01' and '2011/12/31'
group by b.domain_name
order by a.client_id, c.registered_datetime;


/*8 B*/
select CONCAT(a.first_name," ",a.last_name) as client_name, b.domain_name, count(b.site_id) number_of_leads
from clients a LEFT JOIN sites b on a.client_id=b.client_id LEFT JOIN leads c on b.site_id=c.site_id
group by client_name, b.domain_name
order by client_name;



/*9*/
select CONCAT(a.first_name," ",a.last_name) as client_name, sum(b.amount) as total_revenue, monthname(b.charged_datetime) as month_charge, year(b.charged_datetime) as year_charge
from clients a JOIN billing b on a.client_id = b.client_id
group by client_name, month_charge, year_charge
order by a.client_id;


/*10*/
select CONCAT(a.first_name," ",a.last_name) as client_name, group_concat( distinct b.domain_name order by b.domain_name separator ' / ' ) as websites
from clients a LEFT JOIN sites b on a.client_id = b.client_id
group by client_name




