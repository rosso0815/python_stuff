"""create db

Revision ID: 1c20e6a53339
Revises: d821ac509404
Create Date: 2021-03-05 15:18:47.725005

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '1c20e6a53339'
down_revision = 'd821ac509404'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('city',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=100), server_default='', nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('hobby',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=100), server_default='', nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('friend',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=100), server_default='', nullable=True),
    sa.Column('city_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['city_id'], ['city.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('friend_mtm_hobby',
    sa.Column('friend_id', sa.Integer(), nullable=True),
    sa.Column('hobby_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['friend_id'], ['friend.id'], ),
    sa.ForeignKeyConstraint(['hobby_id'], ['hobby.id'], )
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('friend_mtm_hobby')
    op.drop_table('friend')
    op.drop_table('hobby')
    op.drop_table('city')
    # ### end Alembic commands ###