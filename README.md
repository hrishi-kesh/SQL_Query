<!-- Logo and Title -->
<p align="center">
  <a href="https://github.com/hrishi-kesh" target="_blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/5/50/Oracle_logo.svg" alt="Oracle PLSQL Logo" width="120"/>
  </a>
</p>

<h1 align="center">🚀 Oracle PLSQL Portfolio</h1>

<p align="center">
  <b>Comprehensive Oracle SQL & PL/SQL Scripts, Views, and Materialized Views</b><br>
  <a href="https://github.com/hrishi-kesh" target="_blank">by Hrishikesh Kumar</a>
</p>

---

## 🌟 Repository Highlights

- **SQL Views**  
  Secure, reusable, and simplified data access using standard and updatable views.

- **Materialized Views**  
  Performance-optimized, precomputed query results with refresh strategies and real-world examples.

- **Table Design & Data Modeling**  
  Sample schemas, realistic data, and best practices for Oracle environments.

- **Practical Scenarios**  
  Security, query simplification, and performance optimization in action.

---

## 🛠️ Technologies & Tools

[![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)](https://www.oracle.com/database/)
[![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.oracle.com/database/technologies/appdev/sql.html)
[![VS Code](https://img.shields.io/badge/VS%20Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white)](https://code.visualstudio.com/)
[![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/)

---

## 📂 Explore the Repository

- `SQL_Views.sql` — Examples and explanations of SQL views, updatable views, and materialized views
- Table creation, data insertion, and view management scripts
- Realistic scenarios for data security, query simplification, and performance optimization

---

## 📝 Example Usage

```sql
-- Create a view for expensive products
CREATE OR REPLACE VIEW expensive_products AS
SELECT * FROM tb_product_info WHERE price > 1000;

-- Query a materialized view
SELECT * FROM MV_Retail_Sales;

-- Refresh a materialized view
EXEC DBMS_MVIEW.REFRESH('MV_Retail_Sales', 'C');
```

---

## 📖 Learning Topics
- What are SQL Views and Materialized Views?
- Advantages of using views (security, simplification, abstraction)
- Updatable views and their limitations
- Materialized view refresh strategies (ON DEMAND, ON COMMIT, FAST, COMPLETE)
- Real-world use cases and best practices

---

## 💡 Getting Started
1. Clone this repository
2. Open the `.sql` files in your favorite SQL editor (e.g., Oracle SQL Developer, VS Code)
3. Run the scripts in your Oracle database environment

---

## 🤝 Contributing
Contributions, suggestions, and improvements are welcome! Feel free to open issues or submit pull requests.

---

## 👤 Author & Links

- **Author:** [Hrishikesh Kumar](https://github.com/hrishi-kesh)
- **GitHub:** [https://github.com/hrishi-kesh](https://github.com/hrishi-kesh)
- **LinkedIn:** [https://www.linkedin.com/in/your-linkedin-profile](https://www.linkedin.com/in/hrishikesh-kumar-3900a1115/)

<p align="center">
  <a href="https://github.com/hrishi-kesh" target="_blank">
    <img src="https://img.shields.io/github/followers/hrishi-kesh?label=Follow&style=social" alt="GitHub Follow"/>
  </a>
</p>

<p align="center">
  <a href="https://github.com/hrishi-kesh" target="_blank">
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
  </a>
  <a href="https://www.linkedin.com/in/hrishikesh-kumar-3900a1115/" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"/>
  </a>
  <a href="https://leetcode.com/u/hrishik005/" target="_blank">
    <img src="https://img.shields.io/badge/LeetCode-FFA116?style=for-the-badge&logo=leetcode&logoColor=white" alt="LeetCode"/>
  </a>
  <a href="https://www.hackerrank.com/profile/HRISHIK005" target="_blank">
    <img src="https://img.shields.io/badge/HackerRank-2EC866?style=for-the-badge&logo=hackerrank&logoColor=white" alt="HackerRank"/>
  </a>
</p>

> **Happy Learning and Coding!**
