class OffersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_offer, only: [:accept, :reject]
    before_action :is_authorised, only: [:accept, :reject]


    def create
        req = Request.find(offer_params[:request_id])

        if req && req.user_id == current_user.id
            redirect_to request.referrer, alert: "You can not make an offer for your own request" and return
        end 

        if Offer.exists?(user_id: current_user.id, request_id: offer_params[:request_id])
            redirect_to request.referrer, alert: "You have already made an offer for this request!" and return
        end

        @offer = current_user.offers.build(offer_params)
        if @offer.save
            redirect_to request.referrer, notice: "Saved..." and return
        else
            redirect_to request.referrer, flash: {error: @offer.errors.full_messages.join(', ')} and return
        end
    end

    def accept
    end

    def reject
    end

    private

    def set_offer
        @offer = Offer.find(params[:id])
    end

    def is_authorised
        redirect_to root_path, alert: "You do not have permission" unless current_user.id == @offer.request.user_id 
    end

    def offer_params
        params.require(:offer).permit(:amount, :days, :note, :request_id, :status)
    end
end
