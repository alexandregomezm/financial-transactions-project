-- View: public.vw_churn_criteria

-- DROP VIEW public.vw_churn_criteria;

CREATE OR REPLACE VIEW public.vw_churn_criteria
 AS
 WITH last_transaction_per_client AS (
         SELECT da.customerid,
            max(ft.transactiondate) AS last_transaction
           FROM facttransaction ft
             LEFT JOIN dimaccount da ON ft.accountid = da.accountid
          GROUP BY da.customerid
        ), churn AS (
         SELECT last_transaction_per_client.customerid,
            '2025-12-31'::date - last_transaction_per_client.last_transaction AS time_since_last_transaction
           FROM last_transaction_per_client
          ORDER BY last_transaction_per_client.customerid
        ), churn_status_per_customer AS (
         SELECT churn.customerid,
            churn.time_since_last_transaction,
                CASE
                    WHEN churn.time_since_last_transaction < 27 THEN 'ATIVO'::text
                    WHEN churn.time_since_last_transaction < 54 THEN 'EM RISCO'::text
                    WHEN churn.time_since_last_transaction < 81 THEN 'INATIVO'::text
                    ELSE 'CHURNED'::text
                END AS churn_status
           FROM churn
        )
 SELECT customerid,
    time_since_last_transaction,
    churn_status
   FROM churn_status_per_customer;

ALTER TABLE public.vw_churn_criteria
    OWNER TO postgres;

