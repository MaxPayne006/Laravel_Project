@extends('layouts.app')
@section('styles')
<link rel="stylesheet" href="/CSS/contact-us.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" media="screen" href="https://fontlibrary.org//face/averia-sans-gwf" type="text/css">
@endsection

@section('content')
    <div class="container" style="margin-top: 2rem;">
        <div class="row">
            <div id="map" class="col-12 col-md-12 col-lg-6">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3320.9732097248325!2d73.15632621473046!3d33.65785604585842!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38dfeb104a188d9d%3A0x719284290cc3d2c2!2sHostel%20City!5e0!3m2!1sen!2s!4v1655547785597!5m2!1sen!2s"
                    width="100%" height="517" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div id="contact-part" class="col-12 col-md-12 col-lg-6" style="margin-bottom: 2rem !important;">
                <form id="contact-form" method="post" action="contact-us">
                    @csrf
                    <h4>We would love to hear from you</h4>
                    <div class="form-group">
                        <label for="contactName">Name</label>
                        <input type="text" class="form-control" id="contactName" name="contactName">
                        <small id="nameErr" class="error"></small>
                    </div>
                    <div class="form-group">
                        <label for="contactEmail">Email</label>
                        <input type="Email" class="form-control" id="contactEmail" name="contactEmail">
                        <small id="emailErr" class="error"></small>
                    </div>
                    <div class="form-group">
                        <label for="contactSubject">Subject</label>
                        <input type="text" class="form-control" id="contactSubject" name="contactSubject">
                    </div>
                    <div class="form-group">
                        <label for="contactArea">Message</label>
                        <textarea class="form-control" id="contactArea" rows="5" name="contactMessage"></textarea>
                    </div>
                    <div class="button-sub">
                        <button class="btn btn-primary" type="submit" onclick="validation(event)">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    <script src="/js/contact-us.js"></script>
@endsection
