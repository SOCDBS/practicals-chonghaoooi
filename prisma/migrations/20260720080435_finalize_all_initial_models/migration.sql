-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_adm_no_fkey";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_mod_registered_fkey";

-- AlterTable
ALTER TABLE "stud_mod_performance" ALTER COLUMN "mark" DROP NOT NULL,
ALTER COLUMN "grade" DROP NOT NULL;

-- AlterTable
ALTER TABLE "student" ALTER COLUMN "mobile_phone" DROP NOT NULL,
ALTER COLUMN "home_phone" DROP NOT NULL;

-- RenameForeignKey
ALTER TABLE "course" RENAME CONSTRAINT "fk_course_offered_by" TO "course_offered_by_fk";

-- AddForeignKey
ALTER TABLE "module" ADD CONSTRAINT "mod_mod_coord_fk" FOREIGN KEY ("mod_coord") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
