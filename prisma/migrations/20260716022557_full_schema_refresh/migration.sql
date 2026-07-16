/*
  Warnings:

  - You are about to drop the column `gpa` on the `student` table. All the data in the column will be lost.
  - You are about to drop the column `gpa_last_updated` on the `student` table. All the data in the column will be lost.
  - Added the required column `dept_name` to the `department` table without a default value. This is not possible if the table is not empty.
  - Added the required column `citizenship` to the `staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `designation` to the `staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dob` to the `staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gender` to the `staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `grade` to the `staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `highest_qln` to the `staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `join_yr` to the `staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `marital_status` to the `staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `staff_name` to the `staff` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type_of_employment` to the `staff` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_adm_no_fk";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_mod_registered_fk";

-- AlterTable
ALTER TABLE "department" ADD COLUMN     "budget" DECIMAL(9,2),
ADD COLUMN     "dept_name" VARCHAR(100) NOT NULL,
ADD COLUMN     "expenditure" DECIMAL(9,2),
ADD COLUMN     "hod_appt_date" DATE,
ADD COLUMN     "max_staff_strength" INTEGER,
ADD COLUMN     "no_of_staff" INTEGER;

-- AlterTable
ALTER TABLE "staff" ADD COLUMN     "allowance" DECIMAL(7,2),
ADD COLUMN     "citizenship" VARCHAR(10) NOT NULL,
ADD COLUMN     "designation" VARCHAR(20) NOT NULL,
ADD COLUMN     "dob" DATE NOT NULL,
ADD COLUMN     "gender" CHAR(1) NOT NULL,
ADD COLUMN     "grade" VARCHAR(5) NOT NULL,
ADD COLUMN     "highest_qln" VARCHAR(10) NOT NULL,
ADD COLUMN     "hourly_rate" DECIMAL(7,2),
ADD COLUMN     "join_yr" INTEGER NOT NULL,
ADD COLUMN     "marital_status" VARCHAR(1) NOT NULL,
ADD COLUMN     "pay" DECIMAL(7,2),
ADD COLUMN     "staff_name" VARCHAR(100) NOT NULL,
ADD COLUMN     "supervisor_staff_no" CHAR(4),
ADD COLUMN     "type_of_employment" VARCHAR(2) NOT NULL;

-- AlterTable
ALTER TABLE "student" DROP COLUMN "gpa",
DROP COLUMN "gpa_last_updated";

-- CreateTable
CREATE TABLE "staff_backup" (
    "staff_no" CHAR(4) NOT NULL,
    "staff_name" VARCHAR(100) NOT NULL,
    "supervisor" CHAR(4),
    "dob" DATE NOT NULL,
    "grade" VARCHAR(5) NOT NULL,
    "marital_status" VARCHAR(1) NOT NULL,
    "pay" DECIMAL(7,2),
    "allowance" DECIMAL(7,2),
    "hourly_rate" DECIMAL(7,2),
    "gender" CHAR(1) NOT NULL,
    "citizenship" VARCHAR(10) NOT NULL,
    "join_yr" INTEGER NOT NULL,
    "dept_code" VARCHAR(5) NOT NULL,
    "type_of_employment" VARCHAR(2) NOT NULL,
    "highest_qln" VARCHAR(10) NOT NULL,
    "designation" VARCHAR(20) NOT NULL,

    CONSTRAINT "staff_backup_pkey" PRIMARY KEY ("staff_no")
);

-- CreateTable
CREATE TABLE "user_account" (
    "id" INTEGER NOT NULL,
    "account_no" VARCHAR(6) NOT NULL,
    "role" INTEGER NOT NULL,
    "password" VARCHAR(255) NOT NULL,

    CONSTRAINT "user_account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_role" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR(25) NOT NULL,

    CONSTRAINT "user_role_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE RESTRICT ON UPDATE CASCADE;
