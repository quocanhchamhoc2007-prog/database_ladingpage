-- Bước 1: Tạo cơ sở dữ liệu nếu chưa có (thay đổi tên DB cho phù hợp với dự án của bạn)
CREATE DATABASE IF NOT EXISTS ai_landing_page_db 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

USE ai_landing_page_db;

-- Bước 2: Xóa bảng cũ nếu tồn tại (để chạy lại script không bị lỗi trùng lặp)
DROP TABLE IF EXISTS `templates`;

-- Bước 3: Tạo bảng templates
CREATE TABLE `templates` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL COMMENT 'Tên định danh của mẫu giao diện',
    `description` TEXT NULL COMMENT 'Mô tả ngắn gọn về phong cách và lĩnh vực phù hợp',
    `thumbnail_url` VARCHAR(255) NOT NULL COMMENT 'Đường dẫn ảnh thu nhỏ (preview)',
    `file_path` VARCHAR(255) NOT NULL COMMENT 'Đường dẫn file mẫu HTML vật lý trong thư mục templates/',
    `placeholders` JSON NOT NULL COMMENT 'Danh sách các thẻ placeholder động mà Gemini API cần sinh dữ liệu',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời gian tạo bản ghi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Bước 4: Seed 3 mẫu Landing Page vào bảng
INSERT INTO `templates` (`name`, `description`, `thumbnail_url`, `file_path`, `placeholders`) VALUES 
(
    'Modern Tech Gadget',
    'Giao diện tối giản phong cách Dark-mode hiện đại, chuyên dùng để làm nổi bật tính năng các sản phẩm công nghệ, thiết bị thông minh hoặc phụ kiện.',
    '/static/thumbnails/modern_tech.jpg',
    'templates/modern_tech.html',
    '["headline", "subheadline", "hero_image_url", "primary_color", "feature_1_title", "feature_1_desc", "feature_2_title", "feature_2_desc", "feature_3_title", "feature_3_desc", "price", "cta_text", "social_facebook", "social_zalo", "social_tiktok"]'
),
(
    'Elegant Beauty & Care',
    'Phong cách thanh lịch, tông màu pastel nhẹ nhàng, bố cục tinh tế giúp tôn vinh hình ảnh các dòng sản phẩm mỹ phẩm, spa hoặc chăm sóc sắc đẹp.',
    '/static/thumbnails/elegant_beauty.jpg',
    'templates/elegant_beauty.html',
    '["headline", "subheadline", "hero_image_url", "primary_color", "ingredients_list", "benefits_text", "original_price", "discounted_price", "cta_text", "social_facebook", "social_instagram", "hotline_number"]'
),
(
    'Luxury Real Estate',
    'Giao diện sang trọng, không gian mở, tập trung vào hình ảnh phối cảnh dự án lớn, vị trí đắc địa và thông tin bảng giá cho các chiến dịch bất động sản.',
    '/static/thumbnails/luxury_estate.jpg',
    'templates/luxury_estate.html',
    '["project_name", "short_description", "hero_image_url", "primary_color", "location_text", "area_size", "price", "amenities_list", "contact_name", "contact_phone", "social_zalo"]'
);