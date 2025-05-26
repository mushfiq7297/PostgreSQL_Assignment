## 🔐 PostgreSQL-এ Primary Key এবং Foreign Key

### 🟡 Primary Key (প্রাইমারি কি)

**Primary Key** হল একটি বা একাধিক কলাম যা একটি টেবিলের প্রতিটি রেকর্ডকে **অন্যদের থেকে আলাদা করে শনাক্ত** করে।

#### ✅ বৈশিষ্ট্যসমূহ:
- প্রতিটি মান **ইউনিক** হতে হবে।
- **NULL** মান রাখা যাবে না।
- প্রতি টেবিলে **মাত্র একটি Primary Key** থাকতে পারে।
- এটি টেবিলের প্রতিটি রেকর্ডের **আইডেন্টিটি কার্ড** হিসেবে কাজ করে।

#### 📘 ব্যবহার কেন:
যেমন একটি জাতীয় পরিচয়পত্র (NID) প্রতিটি নাগরিককে আলাদা করে শনাক্ত করে, ঠিক তেমনি Primary Key একটি টেবিলের প্রতিটি রেকর্ডকে আলাদা করে।

#### উদাহরণ:
```sql
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE
);
```
এখানে student_id প্রতিটি শিক্ষার্থীকে ইউনিকভাবে চিহ্নিত করে।

### 🟡 Foreign Key (ফরেইন কি)
- Foreign Key এমন একটি কলাম যা একটি টেবিলকে অন্য টেবিলের সাথে সম্পর্কিত করে, এবং সেই টেবিলের Primary Key কে রেফারেন্স করে।

✅ বৈশিষ্ট্যসমূহ:
- একটি টেবিলকে অন্য টেবিলের সাথে সংযুক্ত করে।

- ডেটার সঠিকতা নিশ্চিত করে (যেমন: ভুল বিভাগ ID রাখতে দেয় না)।

- NULL মান থাকতে পারে যদি সম্পর্কটি ঐচ্ছিক হয়।

- একটি টেবিলে একাধিক Foreign Key থাকতে পারে।

📘 ব্যবহার কেন:

একটি students টেবিল আছে এবং একটি departments টেবিল আছে। প্রতিটি ছাত্র কোন বিভাগে পড়ছে, সেটা জানাতে students টেবিলে dept_id নামের একটি Foreign Key রাখা হয় যা departments টেবিলের dept_id কে রেফার করে।

উদাহরণ:
```sql
CREATE TABLE departments (
  dept_id SERIAL PRIMARY KEY,
  dept_name TEXT NOT NULL
);

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  dept_id INT REFERENCES departments(dept_id)
);
```
এখানে students.dept_id হল departments.dept_id এর উপরে ভিত্তি করে তৈরি করা একটি Foreign Key।








## 🔤 PostgreSQL-এ `VARCHAR` এবং `CHAR` এর মধ্যে পার্থক্য

`CHAR` এবং `VARCHAR` উভয়ই **টেক্সট বা স্ট্রিং ডেটা টাইপ**, যা PostgreSQL-এ অক্ষর সংরক্ষণ করতে ব্যবহৃত হয়। তবে এদের মধ্যে কিছু গুরুত্বপূর্ণ পার্থক্য রয়েছে যা ডেটাবেজ ডিজাইন করার সময় জানা জরুরি।

---

### 🟦 `CHAR(n)` (Fixed-Length Character)

- `CHAR(n)` হল **স্থির দৈর্ঘ্যের** একটি স্ট্রিং ডেটা টাইপ।
- যেখানে আপনি যতটুকু স্পেস নির্ধারণ করেন (`n`), PostgreSQL ততটুকুই বরাদ্দ করে, এমনকি যদি তার চেয়ে কম ডেটা ইনপুট দেন, তাও।
- অবশিষ্ট অংশ **সাদা স্পেস (space)** দিয়ে পূরণ করে।
- উপযুক্ত যখন স্ট্রিংয়ের দৈর্ঘ্য সবসময় একরকম হবে (যেমন: PIN, কোড ইত্যাদি)।

#### উদাহরণ:
```sql
CREATE TABLE codes (
  pin_code CHAR(6)
);

INSERT INTO codes VALUES ('123');
-- ডেটা ইনসার্ট হবে: '123   ' (শেষে ৩টা স্পেস সহ)
```
🟩 VARCHAR(n) (Variable-Length Character)

- VARCHAR(n) হল পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং ডেটা টাইপ।

- ইনপুট স্ট্রিং-এর দৈর্ঘ্য অনুযায়ী জায়গা বরাদ্দ করে।

- সর্বোচ্চ n অক্ষরের মধ্যে সীমাবদ্ধ রাখতে পারে, তবে কম হলে কোনো স্পেস যোগ হয় না।

- উপযুক্ত যখন স্ট্রিংয়ের দৈর্ঘ্য ভিন্ন ভিন্ন হতে পারে (যেমন: নাম, ঠিকানা ইত্যাদি)।

 উদাহরণ:
```sql
CREATE TABLE users (
  name VARCHAR(50)
);

INSERT INTO users VALUES ('Neon');

```











## ✏️ PostgreSQL-এ `UPDATE` স্টেটমেন্ট দিয়ে ডেটা পরিবর্তন

`UPDATE` স্টেটমেন্ট ব্যবহার করে PostgreSQL ডেটাবেজের **এক বা একাধিক সারির (row) তথ্য পরিবর্তন** করা যায়। এটি  বিদ্যমান তথ্যকে নতুন মানে পরিবর্তন করতে সাহায্য করে।

---

### 🧱 UPDATE স্টেটমেন্টের গঠন (Syntax)

```sql
UPDATE table_name
SET column1 = value1,
    column2 = value2,
    ...
WHERE condition;
```
🔍 ব্যাখ্যা:
table_name → যেই টেবিলের তথ্য আপডেট করতে হবে ।

SET → কোন কোন কলামের মান পরিবর্তন করতে হবে।

WHERE → কোন সারির/সারিগুলোর তথ্য আপডেট করতে হবে, তার শর্ত (condition)। এই অংশ না দিলে সব সারি আপডেট হয়ে যাবে, যা বিপজ্জনক হতে পারে।

সাধারণ উদাহরণঃ 

ধরি একটি employees নামের টেবিল আছে:

```sql
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name TEXT,
  salary NUMERIC
);
```
✅ একজন কর্মচারীর বেতন আপডেট করা:
```sql
UPDATE employees
SET salary = 60000
WHERE id = 3;
```
👉 এই স্টেটমেন্টটি id ৩ নাম্বার কর্মচারীর বেতন 60000 করে দেবে।

একাধিক কলাম আপডেট করা:
```sql
UPDATE employees
SET name = 'Shafayat', salary = 70000
WHERE id = 5;
```
👉 এখানে id ৫-এর কর্মচারীর নাম ও বেতন একসাথে আপডেট করা হয়েছে।

⚠️ সতর্কতা:
❌ যদি  **WHERE**  ক্লজ বাদ পড়ে:
```sql
UPDATE employees
SET salary = 50000;
```
👉 এটি সব কর্মচারীর বেতন একযোগে ৫০,০০০ করে দেবে!
➡️ সেজন্য **WHERE** ক্লজ ব্যবহার অত্যন্ত গুরুত্বপূর্ণ।














## 🧮 PostgreSQL-এ `GROUP BY` ক্লজ ও Aggregation-এ এর ভূমিকা

`GROUP BY` হল SQL-এর একটি শক্তিশালী ক্লজ যা ডেটাকে **নির্দিষ্ট কলামের ভিত্তিতে গ্রুপ বা ভাগে ভাগ** করতে ব্যবহৃত হয়। এই গ্রুপ করা ডেটার উপর অ্যাগ্রিগেট ফাংশন (যেমন: `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()`) প্রয়োগ করে **সারাংশ রিপোর্ট** তৈরি করা যায়।

---

### 🧱 `GROUP BY` এর সাধারণ গঠন (Syntax):

```sql
SELECT column_name, aggregate_function(column_or_expression)
FROM table_name
WHERE condition
GROUP BY column_name;
```
কেন **GROUP BY** দরকার?
আমরা যদি একটি টেবিলের একই ধরনের ডেটাকে একত্র করে তার উপর গণনা করতে চাই—যেমন প্রতি বিভাগে কতজন কর্মচারী, প্রতি পণ্যে মোট বিক্রি, প্রতি শহরে গড় আয় ইত্যাদি—তখন **GROUP BY** অত্যন্ত কার্যকর।

উদাহরণ ১: 

প্রতি বিভাগে কত কর্মচারী আছে?
ধরি আমাদের একটি employees টেবিল আছে:

```sql
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name TEXT,
  department TEXT,
  salary NUMERIC
);
```
এখন আমরা প্রতিটি বিভাগে কতজন কর্মচারী আছে জানতে চাই:

```sql
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;
```
🔍 ব্যাখ্যা:

department অনুযায়ী সব কর্মচারীকে ভাগ করা হয়েছে।

প্রতিটি বিভাগের জন্য কর্মচারীর সংখ্যা গণনা করা হয়েছে।

 উদাহরণ ২: 
 
 প্রতি বিভাগের মোট বেতন:
```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;
```
➡️ এটি প্রতিটি বিভাগের সব কর্মচারীর মোট বেতনের হিসাব দেখাবে।

 উদাহরণ ৩: 
 
 প্রতি বিভাগের সর্বোচ্চ বেতন:
```sql
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;
```
 উদাহরণ ৪: 
 
 প্রতি বিভাগে গড় বেতন:
```sql
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
```
**SELECT** ক্লজে যেসব কলাম থাকবে, সেগুলোর মধ্যে অ্যাগ্রিগেট না হলে সেগুলো অবশ্যই **GROUP BY** তে থাকতে হবে।

❌ এটি চলবে না: SELECT name, COUNT(*) FROM employees GROUP BY department;

✅ এটি সঠিক: SELECT department, COUNT(*) FROM employees GROUP BY department;

**GROUP BY** এর পরে একাধিক কলামও ব্যবহার করা যায়:

```sql
SELECT department, city, COUNT(*) 
FROM employees
GROUP BY department, city;
```












## 📊 PostgreSQL-এ Aggregate Functions (`COUNT()`, `SUM()`, `AVG()`) ব্যবহার করে গণনা

**Aggregate Functions** হল এমন ফাংশন যা একাধিক রেকর্ড বা সারির উপর কাজ করে একটি সারাংশ ফলাফল প্রদান করে। PostgreSQL-সহ সব SQL ডেটাবেজে এই ফাংশনগুলো ডেটা বিশ্লেষণের জন্য খুব গুরুত্বপূর্ণ।

---

## ১. `COUNT()` – সারির সংখ্যা গণনা

এই ফাংশনটি টেবিল বা নির্দিষ্ট কলামে কতগুলো রেকর্ড আছে তা গণনা করতে ব্যবহৃত হয়।

 উদাহরণ: কর্মচারীর মোট সংখ্যা

```sql
SELECT COUNT(*) AS total_employees
FROM employees;
```
➡️ এই কোয়েরি পুরো employees টেবিলের মোট রেকর্ড (সারি) গণনা করবে।

 নির্দিষ্ট কলামের উপর COUNT()
```sql

SELECT COUNT(salary) AS total_with_salary
FROM employees;
```
➡️ এটি শুধু সেই রেকর্ডগুলো গণনা করবে যেখানে salary ফাঁকা (NULL) না।

২. SUM() – মোট যোগফল বের করা
SUM() ব্যবহার করে একটি সংখ্যাগত কলামের সব মানের যোগফল বের করা যায়।

 উদাহরণ:
 
  সকল কর্মচারীর মোট বেতন
```sql
SELECT SUM(salary) AS total_salary
FROM employees;
```
➡️ salary কলামের সব মান যোগ করে মোট বেতন হিসাব করবে।

 ৩. AVG() – গড় বের করা
AVG() একটি সংখ্যাগত কলামের গড় (average) মান গণনা করে।

 উদাহরণ: গড় বেতন
```sql
SELECT AVG(salary) AS average_salary
FROM employees;
```
➡️ এটি salary কলামের গড় মান প্রদান করবে।

GROUP BY এর সাথে Aggregate Functions
তুমি যদি প্রতিটি বিভাগ (department) অনুযায়ী গড় বেতন জানতে চাও:

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```
➡️ এখানে প্রতিটি department অনুযায়ী গড় বেতন আলাদাভাবে দেখানো হবে।


