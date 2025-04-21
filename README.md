# University Data Cleaning Project

This project focuses on cleaning raw university ranking data in preparation for further analysis. The dataset includes information on global universities such as rank, student population, gender ratios, scores in teaching, research, and more.

## 🧹 Cleaning Steps Performed

1. **Removed Duplicates**  
   - Checked for duplicate records using multiple SQL methods.
   - Ensured only unique university-year-country combinations remained.

2. **Handled Null and Blank Values**  
   - Identified blank or missing values in critical columns like Rank, Country, Gender Ratio, etc.
   - Cleaned or replaced values accordingly.

3. **Standardized Data**  
   - Trimmed and converted text columns (e.g., `Country`, `Name`) to lowercase.
   - Standardized score formats using rounding.

4. **Column Transformations**  
   - Split and converted `Female to Male Ratio` into a numeric female percentage.
   - Converted percentage strings (e.g., `International Students`) into numeric format.
   - Added calculated columns such as `female_ratio` and `international_students_perc`.

5. **Dropped Unnecessary Columns**  
   - Removed raw string columns after extracting the needed values.

## 🗂️ Output

The cleaned dataset is saved as:  
**`cleaned_university_data.csv`** *(you can export it from your SQL environment after running the script)*

---

## 📁 Files Included

- `data_cleaning.sql` — SQL script performing the entire cleaning process.
- `cleaned_university_data.csv` *(to be added manually after export)*

## 💡 Tools Used

- MySQL
- SQL Window Functions
- SQL Data Type Conversion

---

## 📌 Usage

To use this script:
1. Create the `uni` table using the same schema as the raw `university` table.
2. Run the script step by step or in sections.
3. Export the cleaned data to a `.csv` using your SQL IDE (like MySQL Workbench, DBeaver, or VS Code SQL extension).

---

## 🧠 Author

This project is part of my learning journey in data analytics and SQL.  
I practiced core data cleaning techniques and efficient SQL querying.

