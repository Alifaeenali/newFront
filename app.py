from flask import Flask, render_template, request, redirect, url_for, flash
import mysql.connector
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'your_strong_secret_key_here' # IMPORTANT: Replace with a strong, unique secret key for security

# Database connection function
def get_db_connection():
    conn = mysql.connector.connect(
        host='localhost',
        user='root',         # Replace with your MySQL username
        password='10,Aug_2023', # Replace with your MySQL password
        database='newFront'
    )
    return conn

UPLOAD_FOLDER = 'static/assets/uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/')
def index():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Fetch all content from all tables
    cursor.execute("SELECT * FROM navSection WHERE id = 1")
    nav_content = cursor.fetchone()

    cursor.execute("SELECT * FROM heroSection WHERE id = 1")
    hero_content = cursor.fetchone()

    cursor.execute("SELECT * FROM clientTrust WHERE id = 1")
    client_trust_content = cursor.fetchone()

    cursor.execute("SELECT * FROM innovationSection WHERE id = 1")
    innovation_content = cursor.fetchone()

    cursor.execute("SELECT * FROM ExperienceSection WHERE id = 1")
    experience_content = cursor.fetchone()

    cursor.execute("SELECT * FROM StatsSection WHERE id = 1")
    stats_content = cursor.fetchone()

    cursor.execute("SELECT * FROM knowSection WHERE id = 1")
    know_content = cursor.fetchone()

    cursor.execute("SELECT * FROM ExploreSection WHERE id = 1")
    explore_content = cursor.fetchone()

    cursor.execute("SELECT * FROM contactSection WHERE id = 1")
    contact_content = cursor.fetchone()

    cursor.execute("SELECT * FROM footerSection WHERE id = 1")
    footer_content = cursor.fetchone()

    conn.close()

    # Combine all content into a single dictionary for easier access in Jinja
    # contact and footer are passed as nested dictionaries as per your HTML usage
    content = {
        **nav_content,
        **hero_content,
        **client_trust_content,
        **innovation_content,
        **experience_content,
        **stats_content,
        **know_content,
        **explore_content,
        'contact': contact_content,
        'footer': footer_content
    }

    return render_template('index.html', **content)


@app.route('/admin', methods=['GET', 'POST'])
def admin():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    if request.method == 'POST':
        try:
            # Update Navbar Section
            cursor.execute("""
                UPDATE navSection SET
                navLogo = %s, anchor1 = %s, dropdown1 = %s, dropdown2 = %s,
                anchor2 = %s, anchor3 = %s, navbtn = %s
                WHERE id = 1
            """, (
                request.form['navLogo'], request.form['anchor1'], request.form['dropdown1'],
                request.form['dropdown2'], request.form['anchor2'], request.form['anchor3'],
                request.form['navbtn']
            ))

            # Update Hero Section
            hero_img_file = request.files.get('heroImg')
            hero_img_path = handle_upload(hero_img_file, 'heroImg') or request.form.get('currentHeroImg') # Assuming a hidden field for current path
            cursor.execute("""
                UPDATE heroSection SET
                heroImg = %s, heroHead1 = %s, heroHead2 = %s, heroPara = %s
                WHERE id = 1
            """, (hero_img_path, request.form['heroHead1'], request.form['heroHead2'], request.form['heroPara']))

            # Update Client Trust Section
            cursor.execute("""
                UPDATE clientTrust SET
                clientHead = %s, clientDscp = %s
                WHERE id = 1
            """, (request.form['clientHead'], request.form['clientDscp']))
            for i in range(1, 10):
                cl_img_file = request.files.get(f'clImg{i}')
                cl_img_path = handle_upload(cl_img_file, f'clImg{i}') or request.form.get(f'currentClImg{i}')
                if cl_img_path:
                    cursor.execute(f"UPDATE clientTrust SET clImg{i} = %s WHERE id = 1", (cl_img_path,))


            # Update Innovation Section
            innovation_video_file = request.files.get('innovationVideo')
            innovation_video_path = handle_upload(innovation_video_file, 'innovationVideo') or request.form.get('currentInnovationVideo')
            cursor.execute("""
                UPDATE innovationSection SET
                innovationh5 = %s, innovationh1 = %s, innovationh2 = %s, innovationPara = %s,
                innovationl1 = %s, innovationl2 = %s, innovationl3 = %s, innovationl4 = %s,
                innovationVideo = %s
                WHERE id = 1
            """, (
                request.form['innovationh5'], request.form['innovationh1'], request.form['innovationh2'],
                request.form['innovationPara'], request.form['innovationl1'], request.form['innovationl2'],
                request.form['innovationl3'], request.form['innovationl4'], innovation_video_path
            ))

            # Update Improve Experience Section
            exp_video_file = request.files.get('expVideo')
            exp_video_path = handle_upload(exp_video_file, 'expVideo') or request.form.get('currentExpVideo')
            cursor.execute("""
                UPDATE ExperienceSection SET
                exph1 = %s, exph2 = %s, exph3 = %s, exppara = %s, expVideo = %s
                WHERE id = 1
            """, (
                request.form['exph1'], request.form['exph2'], request.form['exph3'],
                request.form['exppara'], exp_video_path
            ))

            # Update Stats Section
            cursor.execute("""
                UPDATE StatsSection SET
                statHead = %s, statPara = %s,
                cardHead1 = %s, cardPara1 = %s,
                cardHead2 = %s, cardPara2 = %s,
                cardHead3 = %s, cardPara3 = %s
                WHERE id = 1
            """, (
                request.form['statHead'], request.form['statPara'],
                request.form['cardHead1'], request.form['cardPara1'],
                request.form['cardHead2'], request.form['cardPara2'],
                request.form['cardHead3'], request.form['cardPara3']
            ))
            for i in range(1, 4):
                card_logo_file = request.files.get(f'cardLogo{i}')
                card_logo_path = handle_upload(card_logo_file, f'cardLogo{i}') or request.form.get(f'currentCardLogo{i}')
                if card_logo_path:
                    cursor.execute(f"UPDATE StatsSection SET cardLogo{i} = %s WHERE id = 1", (card_logo_path,))

            # Update Get to Know Section
            know_video_file = request.files.get('knowVideo')
            know_video_path = handle_upload(know_video_file, 'knowVideo') or request.form.get('currentKnowVideo')
            cursor.execute("""
                UPDATE knowSection SET
                knowh1 = %s, know2 = %s, knowVideo = %s
                WHERE id = 1
            """, (request.form['knowh1'], request.form['know2'], know_video_path))

            # Update Explore Industries and Services Section
            cursor.execute("""
                UPDATE ExploreSection SET
                exploreh1 = %s, exploreh2 = %s
                WHERE id = 1
            """, (request.form['exploreh1'], request.form['exploreh2']))
            for i in range(1, 10):
                explore_img_file = request.files.get(f'exploreImg{i}')
                explore_img_path = handle_upload(explore_img_file, f'exploreImg{i}') or request.form.get(f'currentExploreImg{i}')
                if explore_img_path:
                    cursor.execute(f"UPDATE ExploreSection SET exploreImg{i} = %s WHERE id = 1", (explore_img_path,))

            # Update Contact Section
            cursor.execute("""
                UPDATE contactSection SET
                contactHead = %s, contactSubHead = %s,
                firstNameLabel = %s, lastNameLabel = %s, jobTitleLabel = %s,
                companyNameLabel = %s, phoneNumberLabel = %s, emailLabel = %s,
                industryLabel = %s, employeeNumLabel = %s, helpQuestion = %s,
                checkbox1Label = %s, checkbox2Label = %s, checkbox3Label = %s,
                checkbox4Label = %s, checkbox5Label = %s, checkbox6Label = %s,
                additionalDetailsLabel = %s, submitButtonText = %s,
                termsPolicyText = %s, recaptchaText = %s
                WHERE id = 1
            """, (
                request.form['contactHead'], request.form['contactSubHead'],
                request.form['firstNameLabel'], request.form['lastNameLabel'], request.form['jobTitleLabel'],
                request.form['companyNameLabel'], request.form['phoneNumberLabel'], request.form['emailLabel'],
                request.form['industryLabel'], request.form['employeeNumLabel'], request.form['helpQuestion'],
                request.form['checkbox1Label'], request.form['checkbox2Label'], request.form['checkbox3Label'],
                request.form['checkbox4Label'], request.form['checkbox5Label'], request.form['checkbox6Label'],
                request.form['additionalDetailsLabel'], request.form['submitButtonText'],
                request.form['termsPolicyText'], request.form['recaptchaText']
            ))

            # Update Footer Section
            # Handle social image uploads for footer
            social_img1_file = request.files.get('socialImg1')
            social_img1_path = handle_upload(social_img1_file, 'socialImg1') or request.form.get('currentSocialImg1')

            social_img2_file = request.files.get('socialImg2')
            social_img2_path = handle_upload(social_img2_file, 'socialImg2') or request.form.get('currentSocialImg2')

            social_img3_file = request.files.get('socialImg3')
            social_img3_path = handle_upload(social_img3_file, 'socialImg3') or request.form.get('currentSocialImg3')

            social_img4_file = request.files.get('socialImg4')
            social_img4_path = handle_upload(social_img4_file, 'socialImg4') or request.form.get('currentSocialImg4')

            cursor.execute("""
                UPDATE footerSection SET
                footerStatement = %s,
                socialLink1Url = %s, socialImg1 = %s,
                socialLink2Url = %s, socialImg2 = %s,
                socialLink3Url = %s, socialImg3 = %s,
                socialLink4Url = %s, socialImg4 = %s,
                footerLink1Text = %s, footerLink1Url = %s,
                footerLink2Text = %s, footerLink2Url = %s,
                footerLink3Text = %s, footerLink3Url = %s,
                footerLink4Text = %s, footerLink4Url = %s,
                footerLink5Text = %s, footerLink5Url = %s,
                footerLink6Text = %s, footerLink6Url = %s,
                copyrightText = %s, privacyLinkText = %s, privacyLinkUrl = %s,
                footerDescription = %s
                WHERE id = 1
            """, (
                request.form['footerStatement'],
                request.form['socialLink1Url'], social_img1_path,
                request.form['socialLink2Url'], social_img2_path,
                request.form['socialLink3Url'], social_img3_path,
                request.form['socialLink4Url'], social_img4_path,
                request.form['footerLink1Text'], request.form['footerLink1Url'],
                request.form['footerLink2Text'], request.form['footerLink2Url'],
                request.form['footerLink3Text'], request.form['footerLink3Url'],
                request.form['footerLink4Text'], request.form['footerLink4Url'],
                request.form['footerLink5Text'], request.form['footerLink5Url'],
                request.form['footerLink6Text'], request.form['footerLink6Url'],
                request.form['copyrightText'], request.form['privacyLinkText'], request.form['privacyLinkUrl'],
                request.form['footerDescription']
            ))


            conn.commit()
            flash('Content updated successfully!', 'success')
            return redirect(url_for('admin'))
        except Exception as e:
            conn.rollback()
            flash(f'An error occurred: {e}', 'error')
            print(f"Error: {e}") # For debugging
    
    # Fetch all content for the GET request (and initial form population)
    cursor.execute("SELECT * FROM navSection WHERE id = 1")
    nav_content = cursor.fetchone()

    cursor.execute("SELECT * FROM heroSection WHERE id = 1")
    hero_content = cursor.fetchone()

    cursor.execute("SELECT * FROM clientTrust WHERE id = 1")
    client_trust_content = cursor.fetchone()

    cursor.execute("SELECT * FROM innovationSection WHERE id = 1")
    innovation_content = cursor.fetchone()

    cursor.execute("SELECT * FROM ExperienceSection WHERE id = 1")
    experience_content = cursor.fetchone()

    cursor.execute("SELECT * FROM StatsSection WHERE id = 1")
    stats_content = cursor.fetchone()

    cursor.execute("SELECT * FROM knowSection WHERE id = 1")
    know_content = cursor.fetchone()

    cursor.execute("SELECT * FROM ExploreSection WHERE id = 1")
    explore_content = cursor.fetchone()

    cursor.execute("SELECT * FROM contactSection WHERE id = 1")
    contact_content = cursor.fetchone()

    cursor.execute("SELECT * FROM footerSection WHERE id = 1")
    footer_content = cursor.fetchone()


    conn.close()

    # Combine all content into a single dictionary for the admin panel
    # These are merged directly for easier access in the admin.html form
    content = {
        **nav_content,
        **hero_content,
        **client_trust_content,
        **innovation_content,
        **experience_content,
        **stats_content,
        **know_content,
        **explore_content,
        **contact_content,
        **footer_content
    }

    return render_template('admin.html', content=content)

def handle_upload(file, field_name):
    """
    Handles file uploads, saves them, and returns the static path.
    field_name can be used to create subdirectories if needed, or just for logging.
    """
    if file and file.filename:
        filename = secure_filename(file.filename)
        # Create a subdirectory for the field if desired, e.g., 'static/assets/uploads/hero'
        # For simplicity, keeping all in one UPLOAD_FOLDER for now.
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)
        return f"static/assets/uploads/{filename}" # Return path relative to static
    return None

@app.route('/faqs')
def faqs():
    return render_template('faqs.html')

@app.route('/demo')
def demo():
    return render_template('demo-page.html')

if __name__ == '__main__':
    # Ensure upload folder exists
    if not os.path.exists(UPLOAD_FOLDER):
        os.makedirs(UPLOAD_FOLDER)
    app.run(debug=True)