-- Projeção de dados

-- QUERY 1 - quantidade de carros por cliente 
select concat(Fname,' ',Lname) as Name, a.idClient as ID, count(*) as N_of_cars from clients a join vehicle b on a.idClient = b.idClient group by a.idClient order by N_of_cars;

-- QUERY 2 - uso de full outer join para definer serviços como repação ou revisão
select a.idService, case when RType is null then false else true end as Reparation, case when currentMileage is null then false else true end as Revision  from service a left join reparation b on a.idService = b.idService left join service_revision c on a.idService = c.idService union select a.idService, case when RType is null then false else true end as Revision, case when currentMileage is null then false else true end as Reparation from service a right join reparation b on a.idService = b.idService right join service_revision c on a.idService = c.idService;

-- QUERY 3 - mapeamento mecteam e pedidos (quantidade de pedidos de times com mais de um)
select a.indentify, a.idMecteam, count(*) as N_of_Orders from mecTeam a , orders b where a.idMecteam = b.idMecteam group by a.idMecteam having N_of_Orders > 1 order by N_of_Orders DESC;

-- QUERY 4 - mapeamento cliente e pedido (quantos pedidos cada cliente tem)
select concat(Fname,' ',Lname) as Name, a.idClient as ID, count(*) as N_of_orders from clients a, orders b where a.idClient = b.idClient group by a.idClient order by N_of_orders;

-- QUERY 5 -mapeamento de peça e ordem de serviço (cojm acrescimo de 10% do valor original no valor das peças e na ordem de serviço)
select a.idPart, round(Pvalue*1.1,2) as Part_value, b.quantity, round(totalValue*1.1,2) as OS_value from part a, sopart b, service_order c where a.idPart = b.idPart and b.idService_order = c.idService_order;