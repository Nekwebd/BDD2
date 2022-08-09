USE GESCOM5;

-- 1. Afficher la liste de tous les commerciaux.
--SELECT * FROM posts
--WHERE (pos_libelle) = 'Commercial';

-- 2. Afficher les produits vendus depuis moins de 4 ans.
--SELECT * FROM orders
--WHERE (ord_reception_date)('%d-%m-%Y') < '26/06/216';

-- 3. Afficher les cat�gories appartenant � la cat�gorie "Mobilier de jardin"
--SELECT * FROM categories
--where (cat_id) = 6 OR (cat_libelle) = Mobilier de jardin;

-- 4. Afficher les fournisseurs proposants des produits de la gamme "Arbres et arbustes"
--SELECT * FROM products
--WHERE (pro_sup_id) = 4;

-- 5. Afficher les commandes pass�es par le Client "Gonzales Kennedy"
--SELECT * FROM customers
--WHERE (cus_lastname) = 'GONZALES' AND (cus_firstname) = 'KENNEDY';

-- 6. Afficher tous les clients espagnols.
--SELECT * FROM customers
--WHERE cus_cou_id = 'ES' ;

-- 7. Afficher le prix, la r�f�rence, la date d'ajout, la couleur et le stock disponible pour le produit "Scie � main SCM0555"
--SELECT (pro_price), (pro_ref), (pro_add_date), (pro_color), (pro_stock_phy)  FROM products
--WHERE pro_name = 'scie � main SCM055' AND pro_cat_id = 1;

--8. Afficher tous les produits qui ont d�j� �t� vendu.
--SELECT * FROM orders
--WHERE (ord_reception_date) < CURRENT_TIMESTAMP;

-- 9. Afficher la liste des produits qui n'ont jamais �t� vendu.
-- A REVOIR
--SELECT * FROM products
--WHERE pro_stock_phy > 0;
--SELECT * FROM order_details
--WHERE ode_id = null

--10. Afficher le nom, prenom et poste des employ�s ainsi que le nom, prenom et poste de leur sup�rieur hierarchique
-- A REVOIR 
-- SELECT emp_lname, emp_fname, emp_pos_id, emp_superior_id FROM employees;

--11. Afficher les produits mis � jour moins d'un moins apr�s leur ajout.
--INSERT pro_date_date TO products
--WHERE pro_date_date = pro_add_date + 1 mois;

--SELECT * FROM products
--WHERE pro_date_date < pro_update_date;

--DELETE pro_date_date FROM products;

--12. Afficher les commandes pass� par les clients fran�ais.
--SELECT * FROM customers
--WHERE cus_cou_id = 'FR' ;