/*
  Warnings:

  - You are about to drop the column `budget` on the `department` table. All the data in the column will be lost.
  - You are about to drop the column `dept_name` on the `department` table. All the data in the column will be lost.
  - You are about to drop the column `expenditure` on the `department` table. All the data in the column will be lost.
  - You are about to drop the column `hod_appt_date` on the `department` table. All the data in the column will be lost.
  - You are about to drop the column `max_staff_strength` on the `department` table. All the data in the column will be lost.
  - You are about to drop the column `no_of_staff` on the `department` table. All the data in the column will be lost.
  - You are about to drop the column `allowance` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `citizenship` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `designation` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `dob` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `gender` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `grade` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `highest_qln` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `hourly_rate` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `join_yr` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `marital_status` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `pay` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `staff_name` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `supervisor_staff_no` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the column `type_of_employment` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the `staff_backup` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_account` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_role` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE "department" DROP COLUMN "budget",
DROP COLUMN "dept_name",
DROP COLUMN "expenditure",
DROP COLUMN "hod_appt_date",
DROP COLUMN "max_staff_strength",
DROP COLUMN "no_of_staff";

-- AlterTable
ALTER TABLE "staff" DROP COLUMN "allowance",
DROP COLUMN "citizenship",
DROP COLUMN "designation",
DROP COLUMN "dob",
DROP COLUMN "gender",
DROP COLUMN "grade",
DROP COLUMN "highest_qln",
DROP COLUMN "hourly_rate",
DROP COLUMN "join_yr",
DROP COLUMN "marital_status",
DROP COLUMN "pay",
DROP COLUMN "staff_name",
DROP COLUMN "supervisor_staff_no",
DROP COLUMN "type_of_employment";

-- AlterTable
ALTER TABLE "student" ADD COLUMN     "gpa" DECIMAL(4,2),
ADD COLUMN     "gpa_last_updated" DATE;

-- DropTable
DROP TABLE "staff_backup";

-- DropTable
DROP TABLE "user_account";

-- DropTable
DROP TABLE "user_role";

-- AddForeignKey
ALTER TABLE "staff" ADD CONSTRAINT "staff_dept_code_fk" FOREIGN KEY ("dept_code") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "department" ADD CONSTRAINT "dept_hod_fk" FOREIGN KEY ("hod") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "fk_course_offered_by" FOREIGN KEY ("offered_by") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_mod_code_fk" FOREIGN KEY ("mod_code") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_requisite_fk" FOREIGN KEY ("requisite") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_crse_code_fk" FOREIGN KEY ("crse_code") REFERENCES "course"("crse_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_nationality_fk" FOREIGN KEY ("nationality") REFERENCES "country"("country_name") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fk" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fk" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
