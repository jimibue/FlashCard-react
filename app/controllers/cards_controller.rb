class CardsController < ApplicationController
   def index
    @cards = Card.all

    render component: 'Cards', props: {cards: @cards}
   end

   def create
    @card = Card.create(card_params)

    render json: @card
   end

   def show
    @card = Card.find(params[:id])
    render component: "Card", props: {card: @card }
   end

   def destroy
    @card = Card.find(params[:id])
    @card.destroy

    render json: @card
   end

   private

   def card_params
    params.require(:card).permit(:name, :result)
   end

end
