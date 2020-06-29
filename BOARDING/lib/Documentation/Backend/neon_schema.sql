-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema users
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema users
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `users` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `users` ;

-- -----------------------------------------------------
-- Table `users`.`auth_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`auth_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`django_content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`django_content_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`auth_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`auth_permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC) VISIBLE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `users`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 97
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`auth_group_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`auth_group_permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `users`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `users`.`auth_group` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`auth_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME(6) NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`auth_user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`auth_user_groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC) VISIBLE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `users`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`auth_user_user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`auth_user_user_permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `users`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`authtoken_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`authtoken_token` (
  `key` VARCHAR(40) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`django_admin_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`django_admin_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC) VISIBLE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `users`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`django_migrations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`django_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`notifications_notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`notifications_notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `level` VARCHAR(20) NOT NULL,
  `unread` TINYINT(1) NOT NULL,
  `actor_object_id` VARCHAR(255) NOT NULL,
  `verb` VARCHAR(255) NOT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `target_object_id` VARCHAR(255) NULL DEFAULT NULL,
  `action_object_object_id` VARCHAR(255) NULL DEFAULT NULL,
  `timestamp` DATETIME(6) NOT NULL,
  `public` TINYINT(1) NOT NULL,
  `action_object_content_type_id` INT NULL DEFAULT NULL,
  `actor_content_type_id` INT NOT NULL,
  `recipient_id` INT NOT NULL,
  `target_content_type_id` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NOT NULL,
  `emailed` TINYINT(1) NOT NULL,
  `data` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co` (`action_object_content_type_id` ASC) VISIBLE,
  INDEX `notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co` (`actor_content_type_id` ASC) VISIBLE,
  INDEX `notifications_notifi_target_content_type__ccb24d88_fk_django_co` (`target_content_type_id` ASC) VISIBLE,
  INDEX `notifications_notification_deleted_b32b69e6` (`deleted` ASC) VISIBLE,
  INDEX `notifications_notification_emailed_23a5ad81` (`emailed` ASC) VISIBLE,
  INDEX `notifications_notification_public_1bc30b1c` (`public` ASC) VISIBLE,
  INDEX `notifications_notification_unread_cce4be30` (`unread` ASC) VISIBLE,
  INDEX `notifications_notification_timestamp_6a797bad` (`timestamp` ASC) VISIBLE,
  INDEX `notifications_notification_recipient_id_unread_253aadc9_idx` (`recipient_id` ASC, `unread` ASC) VISIBLE,
  CONSTRAINT `notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co`
    FOREIGN KEY (`action_object_content_type_id`)
    REFERENCES `users`.`django_content_type` (`id`),
  CONSTRAINT `notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co`
    FOREIGN KEY (`actor_content_type_id`)
    REFERENCES `users`.`django_content_type` (`id`),
  CONSTRAINT `notifications_notifi_target_content_type__ccb24d88_fk_django_co`
    FOREIGN KEY (`target_content_type_id`)
    REFERENCES `users`.`django_content_type` (`id`),
  CONSTRAINT `notifications_notification_recipient_id_d055f3f0_fk_auth_user_id`
    FOREIGN KEY (`recipient_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_achievements` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` LONGTEXT NOT NULL,
  `title` VARCHAR(32) NOT NULL,
  `user_id` INT NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `rest_apis_achievements_user_id_49b932d8_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_achievements_user_id_49b932d8_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_badge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_badge` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(32) NOT NULL,
  `image_url` VARCHAR(40) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `rest_apis_badge_user_id_11400d78_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_badge_user_id_11400d78_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_blog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_blog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` LONGTEXT NOT NULL,
  `description` LONGTEXT NOT NULL,
  `link` VARCHAR(200) NOT NULL,
  `user_id` INT NOT NULL,
  `blog_site` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `rest_apis_blog_user_id_cf7f4d38_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_blog_user_id_cf7f4d38_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_certification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_certification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` LONGTEXT NOT NULL,
  `organization` LONGTEXT NOT NULL,
  `certificate_type` LONGTEXT NOT NULL,
  `year` VARCHAR(4) NOT NULL,
  `certificate` VARCHAR(200) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `rest_apis_certification_user_id_52a0a9ae_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_certification_user_id_52a0a9ae_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_chat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(200) NOT NULL,
  `receiver_id` INT NOT NULL,
  `sender_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `rest_apis_chat_receiver_id_e1ed2736_fk_auth_user_id` (`receiver_id` ASC) VISIBLE,
  INDEX `rest_apis_chat_sender_id_9897f893_fk_auth_user_id` (`sender_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_chat_receiver_id_e1ed2736_fk_auth_user_id`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `users`.`auth_user` (`id`),
  CONSTRAINT `rest_apis_chat_sender_id_9897f893_fk_auth_user_id`
    FOREIGN KEY (`sender_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_communication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_communication` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `medium` VARCHAR(100) NOT NULL,
  `medium_url` VARCHAR(200) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `rest_apis_communication_user_id_923b19ec_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_communication_user_id_923b19ec_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `degree` LONGTEXT NOT NULL,
  `institute` LONGTEXT NOT NULL,
  `year` VARCHAR(4) NOT NULL,
  `specialization` LONGTEXT NOT NULL,
  `gpa` LONGTEXT NOT NULL,
  `user_id` INT NOT NULL,
  `status` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `rest_apis_education_user_id_d5649c9b_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_education_user_id_d5649c9b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_hobby`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_hobby` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_hobby_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_hobby_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hobby_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rest_apis_hobby_users_hobby_id_userinfo_id_61565785_uniq` (`hobby_id` ASC, `user_id` ASC) VISIBLE,
  INDEX `rest_apis_hobby_users_user_id_55a16d5b_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_hobby_users_hobby_id_c18f0514_fk_rest_apis_hobby_id`
    FOREIGN KEY (`hobby_id`)
    REFERENCES `users`.`rest_apis_hobby` (`id`),
  CONSTRAINT `rest_apis_hobby_users_user_id_55a16d5b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 162
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_industries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_industries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_languages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_projects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `info` VARCHAR(32) NOT NULL,
  `starts` DATE NOT NULL,
  `ends` DATE NOT NULL,
  `status` VARCHAR(32) NOT NULL,
  `project_description` VARCHAR(300) NOT NULL,
  `Industry_of_the_client` LONGTEXT NOT NULL,
  `Role` LONGTEXT NOT NULL,
  `client_location` LONGTEXT NOT NULL,
  `client_name` LONGTEXT NOT NULL,
  `location_of_project_execution` LONGTEXT NOT NULL,
  `team_size` LONGTEXT NOT NULL,
  `benefits` LONGTEXT NOT NULL,
  `multi_vendor` TINYINT(1) NOT NULL,
  `project_details` LONGTEXT NOT NULL,
  `proposed_solution` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 36
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_skill_names`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_skill_names` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_projects_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_projects_skills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `projects_id` INT NOT NULL,
  `skill_names_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rest_apis_projects_skill_projects_id_skill_names__7065e08e_uniq` (`projects_id` ASC, `skill_names_id` ASC) VISIBLE,
  INDEX `rest_apis_projects_s_skill_names_id_40087efe_fk_rest_apis` (`skill_names_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_projects_s_projects_id_8afffac3_fk_rest_apis`
    FOREIGN KEY (`projects_id`)
    REFERENCES `users`.`rest_apis_projects` (`id`),
  CONSTRAINT `rest_apis_projects_s_skill_names_id_40087efe_fk_rest_apis`
    FOREIGN KEY (`skill_names_id`)
    REFERENCES `users`.`rest_apis_skill_names` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_projects_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_projects_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `projects_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rest_apis_projects_users_projects_id_user_id_9599db3f_uniq` (`projects_id` ASC, `user_id` ASC) VISIBLE,
  INDEX `rest_apis_projects_users_user_id_1e5cbcd3_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_projects_u_projects_id_010e6293_fk_rest_apis`
    FOREIGN KEY (`projects_id`)
    REFERENCES `users`.`rest_apis_projects` (`id`),
  CONSTRAINT `rest_apis_projects_users_user_id_1e5cbcd3_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_skills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `competancy` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_skills_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_skills_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `skills_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rest_apis_skills_users_skills_id_userinfo_id_8f8c2e3e_uniq` (`skills_id` ASC, `user_id` ASC) VISIBLE,
  INDEX `rest_apis_skills_users_user_id_ecf01942_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_skills_users_skills_id_02185278_fk_rest_apis_skills_id`
    FOREIGN KEY (`skills_id`)
    REFERENCES `users`.`rest_apis_skills` (`id`),
  CONSTRAINT `rest_apis_skills_users_user_id_ecf01942_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 56
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `users`.`rest_apis_userinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users`.`rest_apis_userinfo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `location` VARCHAR(200) NOT NULL,
  `aboutme` VARCHAR(200) NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `rest_apis_userinfo_user_id_ed3d6bc6_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `rest_apis_userinfo_user_id_ed3d6bc6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
