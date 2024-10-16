import pyodbc


class PropertyUtil:
    @staticmethod
    def get_property_string():
        server_name = "LAPTOP-N5SA57O6\MSSQLSERVER01"
        database_name = "SISDataBase"

        conn_str = (
            f"Driver={{SQL Server}};"
            f"Server={server_name};"
            f"Database={database_name};"
            f"Trusted_Connection=yes;"
        )

        return conn_str